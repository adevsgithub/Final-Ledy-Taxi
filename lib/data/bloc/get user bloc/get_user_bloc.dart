import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_ledy_taxi_app/data/Repository/get_user_repo.dart';
import 'package:final_ledy_taxi_app/data/models/User_Info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<UserEvent, UserState> {
  final GetUserRepo _repo = GetUserRepo();
  GetUserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(GetUserLoadingState());
      try {
        final userInfo = await _repo.getUserInfo();
        if (userInfo != null) {
          emit(GetUserSuccess(userInfo));
        } else {
          emit(UserInitial());
        }
      } on DioError catch (error) {
        print(error);
        emit(GetUserErrorState(error));
      }
    });
  }
}
