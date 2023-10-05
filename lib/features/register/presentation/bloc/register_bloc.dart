import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/core/constants/constants.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';
import 'package:carpeta_ciudadana/features/register/domain/usecases/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc({required this.registerUser}) : super(RegisterInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());
      final failureOrSignIn = await registerUser(
        RegisterParams(
          userId: int.parse(event.personId),
          name: event.name,
          address: event.address,
          email: event.email,
          password: event.password,
        ),
      );
      failureOrSignIn.fold((failure) {
        if (failure is ServerFailure) {
          emit(const RegisterErrorState(
            errorMessage: Constants.serverFailureMessage,
          ));
        }
      }, (register) {
        emit(RegisterCompletedState());
        emit(RegisterInitialState());
      });
    });
  }
}
