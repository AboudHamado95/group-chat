import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/usecases/create_user_usecase.dart';

import 'package:chat_group/features/chat/domain/usecases/forgot_password_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/google_auth_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_in_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_up_usecase.dart';
import 'package:chat_group/features/chat/presentation/cubit/credential/credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.createUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitial());

  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final CreateUserUseCase createUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase(user);
      emit(CredentialSuccess());
    } on SocketException catch (error) {
      emit(CredentialFailure(error: error.toString()));
    } catch (error) {
      emit(CredentialFailure(error: error.toString()));
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase(user);
      await createUserUseCase(user);
      emit(CredentialSuccess());
    } on SocketException catch (error) {
      emit(CredentialFailure(error: error.toString()));
    } catch (error) {
      emit(CredentialFailure(error: error.toString()));
    }
  }

  Future<void> submitGoogleAuth() async {
    try {
      await googleAuthUseCase(NoParams());
    } on SocketException catch (error) {
      emit(CredentialFailure(error: error.toString()));
    } catch (error) {
      emit(CredentialFailure(error: error.toString()));
    }
  }

  Future<void> forgotPassword({required UserEntity user}) async {
    try {
      await forgotPasswordUseCase(user.email!);
    } on SocketException catch (error) {
      emit(CredentialFailure(error: error.toString()));
    } catch (error) {
      emit(CredentialFailure(error: error.toString()));
    }
  }
}
