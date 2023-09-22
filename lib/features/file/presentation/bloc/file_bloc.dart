import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:carpeta_ciudadana/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/select_file.dart';
import 'package:carpeta_ciudadana/features/file/domain/usecases/upload_file.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final UploadFile uploadFile;
  final SelectFile selectFile;

  FileBloc({
    required this.uploadFile,
    required this.selectFile,
  }) : super(FileInitialState()) {
    on<FileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FilePickingEvent>((event, emit) async {
      emit(FilePickingState());
      final failureOrVotingSystems = await selectFile(NoParams());
      failureOrVotingSystems.fold((failure) {
        emit(FileErrorState(
          errorMessage: Constants.serverFailureMessage,
        ));
        emit(FileInitialState());
      }, (file) {
        emit(FilePickedState(file: file));
        print('FILE PICKED IN BYTES');
      });
    });
  }
}
