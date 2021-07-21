import 'package:equatable/equatable.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:insta_pic_api/api.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class NotAuthorized extends LoginState {
  final ErrorResponse? reason;

  NotAuthorized([this.reason]);

  @override
  List<Object?> get props => [this.reason];
}

class Authorized extends LoginState {
  final String token;

  Authorized(this.token);

  @override
  List<Object?> get props => [this.token];
}
