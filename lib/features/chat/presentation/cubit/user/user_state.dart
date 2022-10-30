import 'package:equatable/equatable.dart';

import 'package:chat_group/features/chat/domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserEntity> users;
  const UserSuccess({required this.users});

  @override
  List<Object> get props => [users];
}

class UserFailure extends UserState {
  final String error;
  const UserFailure({required this.error});
  @override
  List<Object> get props => [error];
}
