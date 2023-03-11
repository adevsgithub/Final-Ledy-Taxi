import 'package:dio/dio.dart';
import 'package:final_ledy_taxi_app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/Http_servise.dart';
import '../models/User_Info.dart';

class AuthRepository {
  Future<Response> sendOtpCode(String phoneNumber) async {
    final Response response =
        await ApiRequest().doPostRequest(path: "/v1/user/login/$phoneNumber");
    return response;
  }

  Future<UserInfoModel> confirmOtpCode({
    required String otpCode,
    required String phoneNumber,
  }) async {
    final Response response = await ApiRequest()
        .doGetRequest(path: "/v1/user/verify/$phoneNumber/$otpCode");
    final result = UserInfoModel.fromJson(response.data);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Project.accessToken, result.accessToken);
    return UserInfoModel.fromJson(response.data);
  }

  Future<UserInfoModel> createUser() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(Project.accessToken)!;
    String name = prefs.getString(Project.name)!;
    String gender = prefs.getString(Project.gender)!;

    final Response response = await ApiRequest().doPostRequest(
      path: "/v1/user/register",
      headrs: {'Authorization': token},
      body: {
        'full_name': name,
        'gender': gender,
      },
    );

    return UserInfoModel.fromJson(response.data);
  }
}
