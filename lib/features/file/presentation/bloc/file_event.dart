part of 'file_bloc.dart';

abstract class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

class FilePickingEvent extends FileEvent {}

class FileUploadEvent extends FileEvent {
  final String name;
  final int userId;
  final Uint8List file;

  FileUploadEvent({
    required this.name,
    required this.userId,
    required this.file,
  });
}

class FileAuthenticateEvent extends FileEvent {
  final String userId;
  final String docKey;
  final String docTitle;

  FileAuthenticateEvent({
    required this.userId,
    required this.docKey,
    required this.docTitle,
  });
}

class FileDeleteEvent extends FileEvent {
  final String docKey;

  FileDeleteEvent({
    required this.docKey,
  });
}

class FileReadEvent extends FileEvent {
  final int userId;

  FileReadEvent({
    required this.userId,
  });
}
