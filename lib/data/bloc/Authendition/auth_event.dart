part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SendOtpCodeEvent extends AuthEvent {
  final String phoneNumber;

  const SendOtpCodeEvent(this.phoneNumber);
  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber];
}

class ConfirOtpcodeEvent extends AuthEvent {
  final String phoneNumber;
  final String code;

  const ConfirOtpcodeEvent(this.code, this.phoneNumber);
  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber, code];
}
