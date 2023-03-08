// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  List<Object?> get props => [phoneNumber, code];
}

class CreateProfileEvent extends AuthEvent {
  const CreateProfileEvent();

  @override
  List<Object?> get props => [];
}
