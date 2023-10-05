import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/doc_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/authenticate_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/delete_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/read_file.dart';
import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/core/constants/constants.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/select_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/upload_file.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final UploadFile uploadFile;
  final SelectFile selectFile;
  final ReadFile readFile;
  final DeleteFile deleteFile;
  final AuthenticateFile authenticateFile;

  FileBloc({
    required this.uploadFile,
    required this.selectFile,
    required this.readFile,
    required this.deleteFile,
    required this.authenticateFile,
  }) : super(FileInitialState(files: [])) {
    on<FilePickingEvent>((event, emit) async {
      emit(FilePickingState(files: state.files ?? []));
      final failureOrVotingSystems = await selectFile(NoParams());
      failureOrVotingSystems.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
          files: state.files ?? [],
        ));
        emit(FileInitialState(files: state.files ?? []));
      }, (file) {
        emit(FilePickedState(
          file: file.filePickerResult,
          name: file.fileName,
          files: state.files ?? [],
        ));
      });
    });

    on<FileUploadEvent>((event, emit) async {
      emit(FileLoadingState(
        name: event.name,
        file: event.file,
        files: state.files ?? [],
      ));
      final failureOrVotingSystems = await uploadFile(
        UploadFileParams(
          userId: event.userId,
          name: event.name,
          filePickerResult: event.file,
        ),
      );
      failureOrVotingSystems.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
          files: state.files ?? [],
        ));
        emit(FileInitialState(files: state.files ?? []));
      }, (file) {
        emit(FileUploadedState(files: state.files ?? []));
        emit(FileInitialState(files: state.files ?? []));
      });
    });

    on<FileReadEvent>((event, emit) async {
      emit(FileLoadingState(
        name: null,
        file: null,
        files: state.files ?? [],
      ));
      final failureOrFiles =
          await readFile(ReadFileParams(userId: event.userId));
      failureOrFiles.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
          files: state.files ?? [],
        ));
        emit(FileInitialState(files: state.files ?? []));
      }, (files) {
        emit(FilesLoadedState(files: files.data.contents));
        emit(FileInitialState(files: files.data.contents));
      });
    });

    on<FileAuthenticateEvent>((event, emit) async {
      emit(FileLoadingState(
        name: null,
        file: null,
        files: state.files ?? [],
      ));
      final failureOrResponse = await authenticateFile(AuthenticateFileParams(
        userId: event.userId,
        docKey: event.docKey,
        docTitle: event.docTitle,
      ));
      failureOrResponse.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
          files: state.files ?? [],
        ));
        emit(FileInitialState(files: state.files ?? []));
      }, (response) {
        emit(FileCerificatedState(
          files: state.files ?? [],
          response: response.response,
        ));
        emit(FileInitialState(files: state.files ?? []));
      });
    });

    on<FileDeleteEvent>((event, emit) async {
      emit(FileLoadingState(
        name: null,
        file: null,
        files: state.files ?? [],
      ));
      final failureOrDeleted = await deleteFile(DeleteFileParams(
        fileKeys: event.docKey,
      ));
      failureOrDeleted.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
          files: state.files ?? [],
        ));
        emit(FileInitialState(files: state.files ?? []));
      }, (response) {
        state.files!.removeWhere((docfile) => docfile.key == event.docKey);
        emit(FileDeletedState(files: state.files ?? []));
        emit(FileInitialState(files: state.files ?? []));
      });
    });
  }
}
