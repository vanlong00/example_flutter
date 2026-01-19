import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:example/core/utils/helpers/melon_helper.dart';
import 'package:example/data/models/models.dart';

/// Message types for isolate communication
enum IsolateMessageType {
  /// Request to process a file
  processFile,

  /// Response with processed result
  result,

  /// Error occurred during processing
  error,

  /// Request to shutdown the isolate
  shutdown,
}

/// Message structure for isolate communication
class IsolateMessage {
  final IsolateMessageType type;
  final dynamic data;
  final String? id;

  IsolateMessage({required this.type, required this.data, this.id});
}

/// Response from the isolate
class IsolateResponse {
  final String? id;
  final MelonBase? result;
  final String? error;

  IsolateResponse({this.id, this.result, this.error});

  bool get isSuccess => error == null && result != null;
}

/// Controller for managing the file processing isolate
class FileProcessingIsolateController {
  Isolate? _isolate;
  ReceivePort? _receivePort;
  SendPort? _sendPort;
  final _responseController = StreamController<IsolateResponse>.broadcast();
  final _readyCompleter = Completer<void>();

  /// Stream of responses from the isolate
  Stream<IsolateResponse> get responses => _responseController.stream;

  /// Whether the isolate is initialized and ready
  bool get isReady => _sendPort != null && !_readyCompleter.isCompleted;

  /// Initialize the isolate
  Future<void> initialize() async {
    if (_isolate != null) {
      throw StateError('Isolate already initialized');
    }

    _receivePort = ReceivePort();

    // Listen for messages from the isolate
    _receivePort!.listen((message) {
      if (message is SendPort) {
        // First message is the SendPort from the isolate
        _sendPort = message;
        _readyCompleter.complete();
      } else if (message is Map<String, dynamic>) {
        // Parse response from isolate
        final response = IsolateResponse(id: message['id'] as String?, result: message['result'] as MelonBase?, error: message['error'] as String?);
        _responseController.add(response);
      }
    });

    // Spawn the isolate
    _isolate = await Isolate.spawn(_isolateEntryPoint, _receivePort!.sendPort, debugName: 'FileProcessingIsolate');

    // Wait for the isolate to be ready
    await _readyCompleter.future;
  }

  /// Process a file by its path
  Future<String> processFile(String filePath) async {
    if (_sendPort == null) {
      throw StateError('Isolate not initialized. Call initialize() first.');
    }

    final requestId = DateTime.now().millisecondsSinceEpoch.toString();

    _sendPort!.send(IsolateMessage(type: IsolateMessageType.processFile, data: filePath, id: requestId));

    return requestId;
  }

  /// Shutdown the isolate
  Future<void> shutdown() async {
    if (_sendPort != null) {
      _sendPort!.send(IsolateMessage(type: IsolateMessageType.shutdown, data: null));
    }

    await _responseController.close();
    _receivePort?.close();
    _isolate?.kill(priority: Isolate.immediate);

    _isolate = null;
    _receivePort = null;
    _sendPort = null;
  }

  /// Static entry point for the isolate
  static void _isolateEntryPoint(SendPort mainSendPort) {
    final receivePort = ReceivePort();

    // Send the SendPort back to the main isolate
    mainSendPort.send(receivePort.sendPort);

    // Listen for messages from the main isolate
    receivePort.listen((message) async {
      if (message is IsolateMessage) {
        switch (message.type) {
          case IsolateMessageType.processFile:
            await _processFile(message, mainSendPort);
            break;

          case IsolateMessageType.shutdown:
            receivePort.close();
            break;

          default:
            break;
        }
      }
    });
  }

  /// Process a file inside the isolate
  static Future<void> _processFile(IsolateMessage message, SendPort sendPort) async {
    try {
      final filePath = message.data as String;

      // This is where you would:
      // 1. Read the file from the path
      final bytes = await File(filePath).readAsBytes();
      // 2. Parse it into a MelonBase object
      final melonV4 = MelonHelper.formatMelonV4(bytes);

      // 3. Return the result
      final result = MelonBase.v4(melonV4);

      // Send success response
      sendPort.send({'id': message.id, 'result': result, 'error': null});
    } catch (e, stackTrace) {
      // Send error response
      sendPort.send({'id': message.id, 'result': null, 'error': 'Failed to process file: $e\n$stackTrace'});
    }
  }
}

/// Convenience wrapper for easier usage
class FileProcessingIsolate {
  static final FileProcessingIsolate _instance = FileProcessingIsolate._internal();
  factory FileProcessingIsolate() => _instance;
  FileProcessingIsolate._internal();

  final _controller = FileProcessingIsolateController();
  final _pendingRequests = <String, Completer<IsolateResponse>>{};

  /// Initialize the isolate
  Future<void> initialize() async {
    await _controller.initialize();

    // Listen to responses and complete corresponding futures
    _controller.responses.listen((response) {
      if (response.id != null) {
        final completer = _pendingRequests.remove(response.id);
        completer?.complete(response);
      }
    });
  }

  /// Process a file and wait for the result
  Future<MelonBase> processFile(String filePath) async {
    final requestId = await _controller.processFile(filePath);

    final completer = Completer<IsolateResponse>();
    _pendingRequests[requestId] = completer;

    final response = await completer.future;

    if (response.isSuccess) {
      return response.result!;
    } else {
      throw Exception(response.error ?? 'Unknown error');
    }
  }

  /// Shutdown the isolate
  Future<void> shutdown() async {
    // Complete all pending requests with errors
    for (final completer in _pendingRequests.values) {
      completer.completeError('Isolate shutting down');
    }
    _pendingRequests.clear();

    await _controller.shutdown();
  }
}
