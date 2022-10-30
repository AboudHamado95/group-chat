import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:chat_group/core/usecases/usecases.dart';
import 'package:chat_group/features/chat/domain/entities/user_entity.dart';
import 'package:chat_group/features/chat/domain/usecases/get_all_users_usecase.dart';
import 'package:chat_group/features/chat/domain/usecases/update_current_user_usecase.dart';
import 'package:chat_group/features/chat/presentation/cubit/User/User_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
      {required this.getAllUsersUseCases,
      required this.updateCurrentUserUseCase})
      : super(UserInitial());

  final GetAllUsersUseCases getAllUsersUseCases;
  final UpdateCurrentUserUseCase updateCurrentUserUseCase;

  Future<void> getAllUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      getAllUsersUseCases(NoParams()).listen((listUsers) {
        emit(UserSuccess(users: listUsers));
      });
    } on SocketException catch (error) {
      emit(UserFailure(error: error.toString()));
    } catch (error) {
      emit(UserFailure(error: error.toString()));
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    emit(UserLoading());
    try {
      updateCurrentUserUseCase(user);
    } on SocketException catch (error) {
      emit(UserFailure(error: error.toString()));
    } catch (error) {
      emit(UserFailure(error: error.toString()));
    }
  }
}
