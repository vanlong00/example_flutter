import 'dart:async';
import 'dart:io';

import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'explorable_event.dart';
part 'explorable_state.dart';
part 'explorable_bloc.freezed.dart';

class ExplorableBloc extends Bloc<ExplorableEvent, ExplorableState> {
  ExplorableBloc() : super(const ExplorableState()) {
    on<_Started>(_onStarted);
    on<_PickFile>(_onImported);
    on<_ShareFile>(_onShareFile);
    on<_RemoveFile>(_onRemoveFile);
    on<_RemoveAll>(_onRemoveAll);

    add(const ExplorableEvent.started());
  }

  Future<void> _onStarted(_Started event, Emitter<ExplorableState> emit) async {
    emit(state.copyWith(status: ManageFileStatus.loading));

    final dirStorage = await StorageHelper.getCacheDirectoryApp();
    final List<FileSystemEntity> entities = await dirStorage.list().toList();
    if (entities.isEmpty) {
      emit(state.copyWith(status: ManageFileStatus.initial, items: const []));
      return;
    }

    final items = <Explorable>[];
    for (final entity in entities) {
      if (entity is File) {
        items.add(await Explorable.createFile(entity.path, mimeType: "binary/octet-stream"));
      } else if (entity is Directory) {
        items.add(await _buildFolderFromDir(entity));
      }
    }
    emit(state.copyWith(status: ManageFileStatus.loaded, items: items));
  }

  Future<ExplorableFolder> _buildFolderFromDir(Directory dir) async {
    final children = <Explorable>[];
    for (final child in await dir.list().toList()) {
      if (child is File) {
        children.add(await Explorable.createFile(child.path, mimeType: "binary/octet-stream"));
      } else if (child is Directory) {
        children.add(await _buildFolderFromDir(child));
      }
    }
    return Explorable.createFolder(dir.path, children: children);
  }

  Future<void> _onImported(_PickFile event, Emitter<ExplorableState> emit) async {
    final filePickerResult = await FileHelper.pickSingleFile();
    try {
      if (filePickerResult == null || filePickerResult.files.isEmpty) return;
      final file = filePickerResult.files.first;
      final extension = file.extension?.toLowerCase();

      final Explorable imported;
      switch (extension) {
        case 'zip':
          imported = await FileHelper.handleZipFileV2(file);
        case 'melmod':
        case 'melsave':
        case 'melmap':
        case 'melworld':
        case 'mcworld':
        case 'mcpack':
        case 'mcaddon':
        case 'mctemplate':
        case 'mcstructure':
          imported = await FileHelper.handleFileV2(file);
        default:
          throw UnsupportedError('Unsupported file format: .$extension');
      }
      final newItems = [...state.items, imported];
      emit(state.copyWith(status: newItems.isEmpty ? ManageFileStatus.initial : ManageFileStatus.loaded, items: newItems));
    } on UnsupportedError catch (e) {
      AppShowSnackBar.error(message: e.message ?? "Unsupported file format.");
    } on FileReadException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on InvalidFileNameException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on CorruptedArchiveException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on UnsupportedArchiveContentException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } catch (e) {
      AppShowSnackBar.error(message: "Something went wrong while importing the file. Please try again.");
    }
  }

  Future<void> _onShareFile(_ShareFile event, Emitter<ExplorableState> emit) async {
    final filePath = event.filePath;
    final extension = p.extension(filePath).toLowerCase().replaceFirst('.', '');
    try {
      final Explorable imported;
      switch (extension) {
        case 'zip':
          imported = await FileHelper.handleSharedZip(filePath);
        case 'melmod':
        case 'melsave':
        case 'melmap':
        case 'melworld':
        case 'mcworld':
        case 'mcpack':
        case 'mcaddon':
        case 'mctemplate':
        case 'mcstructure':
          imported = await FileHelper.handleSharedFile(filePath);
        default:
          throw UnsupportedError('Unsupported file format: .$extension');
      }
      final newItems = [...state.items, imported];
      emit(state.copyWith(status: newItems.isEmpty ? ManageFileStatus.initial : ManageFileStatus.loaded, items: newItems));
    } on UnsupportedError catch (e) {
      AppShowSnackBar.error(message: e.message ?? "Unsupported file format.");
    } on FileReadException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on InvalidFileNameException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on CorruptedArchiveException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } on UnsupportedArchiveContentException catch (e) {
      AppShowSnackBar.error(message: e.message);
    } catch (e) {
      AppShowSnackBar.error(message: "Something went wrong while handling the shared file. Please try again.");
    }
  }

  Future<void> _onRemoveFile(_RemoveFile event, Emitter<ExplorableState> emit) async {
    final item = event.item;
    if (item is ExplorableFile) {
      final file = File(item.path);
      if (await file.exists()) await file.delete();
    } else if (item is ExplorableFolder) {
      final dir = Directory(item.path);
      if (await dir.exists()) await dir.delete(recursive: true);
    }

    final newItems = _removeItem(state.items, item);
    emit(state.copyWith(status: newItems.isEmpty ? ManageFileStatus.initial : ManageFileStatus.loaded, items: newItems));
  }

  Future<void> _onRemoveAll(_RemoveAll event, Emitter<ExplorableState> emit) async {
    await StorageHelper.clearTemporaryFiles();
    emit(state.copyWith(status: ManageFileStatus.initial, items: const []));
  }

  /// Recursively removes [target] from [items].
  /// Folders that become empty after the removal are also pruned.
  List<Explorable> _removeItem(List<Explorable> items, Explorable target) => items
      .where((e) => e != target)
      .map(
        (e) => switch (e) {
          ExplorableFolder f => f.copyWith(children: _removeItem(f.children, target)),
          _ => e,
        },
      )
      .where(
        (e) => switch (e) {
          ExplorableFolder f => f.children.isNotEmpty,
          _ => true,
        },
      )
      .toList();
}
