part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SendOtpCodeEvent extends AuthEvent {
  final String phoneNumber;

  const SendOtpCodeEvent(this.phoneNumber);
  @override
  List<Object?> get props => [phoneNumber];
}

class ConfirOtpcodeEvent extends AuthEvent {
  final String phoneNumber;
  final String code;

  const ConfirOtpcodeEvent(this.code, this.phoneNumber);
  @override
  List<Object?> get props => [phoneNumber, code];
}

class CreateProfileEvent extends AuthEvent {
  final String token;
  const CreateProfileEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class LogOutEvent extends AuthEvent {
  const LogOutEvent();
  @override
  List<Object?> get props => [];
}
