import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_ledy_taxi_app/data/Repository/get_user_repo.dart';
import 'package:final_ledy_taxi_app/data/models/Get_User_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<UserEvent, UserState> {
  final GetUserRepo _repo = GetUserRepo();
  GetUserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(GetUserLoadingState());
      try {
       final ActiveUserInfo userInfo = await _repo.getUserInfo();
        emit(GetUserSuccess(userInfo));
      } on DioError catch (error) {
        emit(GetUserErrorState(error));
      }
    });
  }
}
