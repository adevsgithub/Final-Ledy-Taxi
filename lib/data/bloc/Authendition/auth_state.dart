part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  final DioError error;
  const AuthErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class OtpCodeSentSuccessState extends AuthState {
  const OtpCodeSentSuccessState();

  @override
  List<Object?> get props => [];
}

class VeriyOtpCodeSuccesState extends AuthState {
  final UserInfoModel userInfo;
  const VeriyOtpCodeSuccesState(this.userInfo);

  @override
  List<Object?> get props => [userInfo];
}

class CreateUserSuccessState extends AuthState {
  final UserInfoModel userInfoModel;

  const CreateUserSuccessState(this.userInfoModel);
  @override
  List<Object?> get props => [userInfoModel];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
