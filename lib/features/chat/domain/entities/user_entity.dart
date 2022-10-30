import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uId;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final bool? isOnline;
  final String? status;
  final String? profileUrl;
  final String? password;
  final String? date;
  final String? gender;
  const UserEntity({
    this.uId,
    this.name,
    this.email,
    this.phoneNumber,
    this.isOnline,
    this.status,
    this.profileUrl,
    this.password,
    this.date,
    this.gender,
  });

  @override
  List<Object?> get props => [
        uId,
        name,
        email,
        phoneNumber,
        isOnline,
        status,
        profileUrl,
        password,
        date,
        gender,
      ];
}
