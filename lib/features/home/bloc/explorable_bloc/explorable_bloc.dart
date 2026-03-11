import 'dart:async';
import 'dart:io';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:example/core/core.dart';
import 'package:example/core/utils/helpers/storage_helper.dart';
import 'package:example/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'explorable_event.dart';
part 'explorable_state.dart';
part 'explorable_bloc.freezed.dart';

class ExplorableBloc extends Bloc<ExplorableEvent, ExplorableState> {
  ExplorableBloc() : super(ExplorableState(tree: TreeNode<Explorable>.root())) {
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
    final List<FileSystemEntity> files = await dirStorage.list().toList();
    if (files.isEmpty) {
      emit(state.copyWith(status: ManageFileStatus.initial));
      return;
    }
    final tree = state.tree;
    for (final entity in files) {
      if (entity is File) {
        tree.add(FileNode(data: await Explorable.createFile(entity.path, mimeType: "binary/octet-stream")));
      } else if (entity is Directory) {
        tree.add(await _buildFolderNode(entity));
      }
    }
    emit(state.copyWith(status: ManageFileStatus.loaded, tree: tree));
  }

  Future<FolderNode> _buildFolderNode(Directory dir) async {
    final folderNode = FolderNode(data: Explorable.createFolder(dir.path));
    final children = await dir.list().toList();
    for (final child in children) {
      if (child is File) {
        folderNode.add(FileNode(data: await Explorable.createFile(child.path, mimeType: "binary/octet-stream")));
      } else if (child is Directory) {
        folderNode.add(await _buildFolderNode(child));
      }
    }
    return folderNode;
  }

  Future<void> _onImported(_PickFile event, Emitter<ExplorableState> emit) async {
    final filePickerResult = await FileHelper.pickSingleFile();

    try {
      if (filePickerResult == null || filePickerResult.files.isEmpty) {
        throw Exception('User canceled file selection');
      }
      final file = filePickerResult.files.first;
      final extension = file.extension?.toLowerCase();

      switch (extension) {
        case 'zip':
          // Handle ZIP file import
          final importedFile = await FileHelper.handleZipFileV2(file);
          final updatedTree = state.tree..add(importedFile);
          emit(state.copyWith(status: ManageFileStatus.loaded, tree: updatedTree));
          break;
        case 'melmod':
        case 'melsave':
        case 'melmap':
        case 'melworld':
        case 'mcworld':
        case 'mcpack':
        case 'mcaddon':
        case 'mctemplate':
        case 'mcstructure':
          // Handle MEL file import
          final importedFile = await FileHelper.handleFileV2(file);
          final updatedTree = state.tree..add(importedFile);
          emit(state.copyWith(status: ManageFileStatus.loaded, tree: updatedTree));
          break;
        default:
          // Unsupported file type
          throw UnsupportedError('Unsupported file format: .$extension');
      }
    } catch (e) {
      print('Error importing file: $e');
    }
  }

  Future<void> _onShareFile(_ShareFile event, Emitter<ExplorableState> emit) async {
    final filePath = event.filePath;
    final extension = p.extension(filePath).toLowerCase().replaceFirst('.', '');
    try {
      switch (extension) {
        case 'zip':
          final importedFile = await FileHelper.handleSharedZip(filePath);
          final updatedTree = state.tree..add(importedFile);
          emit(state.copyWith(status: ManageFileStatus.loaded, tree: updatedTree));
          break;
        case 'melmod':
        case 'melsave':
        case 'melmap':
        case 'melworld':
        case 'mcworld':
        case 'mcpack':
        case 'mcaddon':
        case 'mctemplate':
        case 'mcstructure':
          final importedFile = await FileHelper.handleSharedFile(filePath);
          final updatedTree = state.tree..add(importedFile);
          emit(state.copyWith(status: ManageFileStatus.loaded, tree: updatedTree));
          break;
        default:
          throw UnsupportedError('Unsupported file format: .$extension');
      }
    } catch (e) {
      print('Error handling shared file: $e');
    }
  }

  Future<void> _onRemoveFile(_RemoveFile event, Emitter<ExplorableState> emit) async {
    final data = event.node.data;
    final parentNode = event.node.parent;

    if (data is ExplorableFile) {
      final file = File(data.path);
      if (await file.exists()) await file.delete();
    } else if (data is ExplorableFolder) {
      final dir = Directory(data.path);
      if (await dir.exists()) await dir.delete(recursive: true);
    }
    event.node.delete();

    // If parent is a non-root folder node and is now empty, remove it too
    if (parentNode != null && !parentNode.isRoot && parentNode is FolderNode) {
      if (parentNode.children.isEmpty) {
        final parentData = parentNode.data;
        if (parentData is ExplorableFolder) {
          final dir = Directory(parentData.path);
          if (await dir.exists()) await dir.delete(recursive: true);
        }
        parentNode.delete();
      }
    }

    final isEmpty = state.tree.children.isEmpty;
    emit(state.copyWith(status: isEmpty ? ManageFileStatus.initial : ManageFileStatus.loaded, tree: state.tree));
  }

  Future<void> _onRemoveAll(_RemoveAll event, Emitter<ExplorableState> emit) async {
    await StorageHelper.clearTemporaryFiles();
    state.tree.clear();
    emit(state.copyWith(status: ManageFileStatus.initial, tree: state.tree));
  }
}
