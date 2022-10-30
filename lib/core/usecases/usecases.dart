import 'package:chat_group/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
