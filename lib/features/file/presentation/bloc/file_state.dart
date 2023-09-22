part of 'file_bloc.dart';

abstract class FileState extends Equatable {
  const FileState();

  @override
  List<Object> get props => [];
}

class FileInitialState extends FileState {}

class FilePickingState extends FileState {}

class FilePickedState extends FileState {
  final Uint8List file;

  FilePickedState({required this.file});
}

class FileErrorState extends FileState {
  final String errorMessage;

  FileErrorState({required this.errorMessage});
}
