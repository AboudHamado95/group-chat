import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_group/core/cache/cache_helper.dart';
import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:chat_group/features/chat/domain/usecases/get_current_user_id_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/is_sign_in_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.isSignInUseCase,
      required this.getCurrentUserIdUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase(NoParams());
      if (isSignIn) {
        AppStrings.uId = await getCurrentUserIdUseCase(NoParams());
        emit(AuthenticatedState(uId: AppStrings.uId!));
      } else {
        emit(const UnAuthenticatedState(error: 'Authenticated error'));
      }
    } on SocketException catch (error) {
      emit(UnAuthenticatedState(error: error.toString()));
    }
  }

  Future<void> loggedIn() async {
    try {
      final uId = await getCurrentUserIdUseCase(NoParams());
      CacheHelper.saveData(key: 'uId', value: uId).then((value) {
        AppStrings.uId = uId;
      });
      emit(AuthenticatedState(uId: uId));
    } catch (error) {
      emit(UnAuthenticatedState(error: error.toString()));
    }
  }

  Future<void> loggedOut() async {
    try {
      signOutUseCase(NoParams());
      emit(const UnAuthenticatedState(error: 'Authenticated'));
    } catch (error) {
      emit(UnAuthenticatedState(error: error.toString()));
    }
  }
}
