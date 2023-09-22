import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/core/constants/constants.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';
import 'package:carpeta_ciudadana/features/signin/domain/usecases/sign_in_user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUser signInUser;

  SignInBloc({required this.signInUser}) : super(SignInInitialState()) {
    on<SignInUserEvent>((event, emit) async {
      emit(SignInLoadingState());
      final failureOrSignIn = await signInUser(
        SignInParams(email: event.email, password: event.password),
      );
      failureOrSignIn.fold((failure) {
        if (failure is ServerFailure) {
          emit(const SignInErrorState(
            errorMessage: Constants.serverFailureMessage,
          ));
        }
      }, (authentication) {
        emit(SignedInUserState());
      });
    });
  }
}
