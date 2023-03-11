part of 'get_user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class GetUserErrorState extends UserState {
  final DioError error;

  GetUserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class GetUserSuccess extends UserState {
  final ActiveUserInfo userInfo;

  GetUserSuccess(this.userInfo);
  @override
  List<Object?> get props => [userInfo];
}

class GetUserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}
