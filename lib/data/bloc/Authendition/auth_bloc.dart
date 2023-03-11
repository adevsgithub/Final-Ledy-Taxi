import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Repository/Auth_Repository.dart';
import '../../models/User_Info.dart';
part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<SendOtpCodeEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _repository.sendOtpCode(event.phoneNumber);
        emit(const OtpCodeSentSuccessState());
      } on DioError catch (e) {
        emit(AuthErrorState(e));
      }
    });

    on<ConfirOtpcodeEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final UserInfoModel response =
              await _repository.confirmOtpCode(phoneNumber: event.phoneNumber, otpCode: event.code);
          emit(VeriyOtpCodeSuccesState(response));
        } on DioError catch (e) {
          emit(AuthErrorState(e));
        }

        on<CreateProfileEvent>(
          (event, emit) async {
            emit(AuthLoadingState());
            try {
              await _repository.createUser();
              emit(CreateUserSuccessState());
            } on DioError catch (e) {
              emit(AuthErrorState(e));
            }
          },
        );
      },
    );
  }
}
