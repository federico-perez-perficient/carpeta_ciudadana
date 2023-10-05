part of 'file_bloc.dart';

abstract class FileState extends Equatable {
  final List<DocFile>? files;

  const FileState({required this.files});

  @override
  List<Object> get props => [];
}

class FileInitialState extends FileState {
  FileInitialState({required List<DocFile> files}) : super(files: files);
}

class FileLoadingState extends FileState {
  final Uint8List? file;
  final String? name;

  FileLoadingState({
    required List<DocFile> files,
    required this.file,
    required this.name,
  }) : super(files: files);
}

class FileUploadedState extends FileState {
  FileUploadedState({required List<DocFile> files}) : super(files: files);
}

class FilePickingState extends FileState {
  FilePickingState({required List<DocFile> files}) : super(files: files);
}

class FilesLoadedState extends FileState {
  FilesLoadedState({required List<DocFile> files}) : super(files: files);
}

class FilePickedState extends FileState {
  final Uint8List file;
  final String name;

  FilePickedState({
    required List<DocFile> files,
    required this.file,
    required this.name,
  }) : super(files: files);
}

class FileCerificatedState extends FileState {
  final String response;

  FileCerificatedState({
    required this.response,
    required List<DocFile> files,
  }) : super(files: files);
}

class FileCerificatingState extends FileState {
  FileCerificatingState({
    required List<DocFile> files,
  }) : super(files: files);
}

class FileDeletingState extends FileState {
  FileDeletingState({
    required List<DocFile> files,
  }) : super(files: files);
}

class FileDeletedState extends FileState {
  FileDeletedState({
    required List<DocFile> files,
  }) : super(files: files);
}

class FileErrorState extends FileState {
  final String errorMessage;

  FileErrorState({
    required List<DocFile> files,
    required this.errorMessage,
  }) : super(files: files);
}
