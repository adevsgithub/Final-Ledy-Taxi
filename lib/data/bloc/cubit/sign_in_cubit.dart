import 'package:final_ledy_taxi_app/data/bloc/cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  Future<void> handleSignIn(
      String username, String password, BuildContext context) async {
    if (state.isLoading == true) {
      return;
    }

    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    // final jsonMap = {
    //   'username': username,
    //   'password': password,
    // };

    // final SignInResponse response = await ApiHelper.getClient().signIn(jsonMap);

    // await HiveServise.saveUserInfo(
    //   response.userInfo.username,
    //   response.token,
    //   response.userInfo.id,
    // );

    emit(
      state.copyWith(
        isLoading: false,
        // isSignedIn: true,
      ),
    );

    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) {
    //     return MainTabsPage();
    //   }),
    //   (route) => false,
    // );
  }
}
