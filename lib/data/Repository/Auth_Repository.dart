import 'package:dio/dio.dart';

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
    return UserInfoModel.fromJson(response.data);
  }
}
