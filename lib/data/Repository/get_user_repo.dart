import 'package:dio/dio.dart';
import 'package:final_ledy_taxi_app/data/models/Get_User_info.dart';
import 'package:final_ledy_taxi_app/service/Http_servise.dart';
import 'package:final_ledy_taxi_app/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserRepo {
  Future<ActiveUserInfo> getUserInfo() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(Project.accessToken)!;
    
    final Response response = await ApiRequest().doGetRequest(
      path: "/v1/user",
      headers: {'Authorization': token},
    );
    final result = ActiveUserInfo.fromJson(response.data);
    return result;
  }
}
