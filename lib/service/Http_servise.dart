import 'package:dio/dio.dart' show BaseOptions, Dio, Options, Response;

import '../utils/constants/constants.dart';

class ApiRequest {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ));

  Future<dynamic> doGetRequest(
      {required String path, Map<String, dynamic>? query}) async {
    final Response response = await dio.get(path, queryParameters: query);
    return response;
  }

  Future<Response> doPostRequest(
      {required String path,
      Map<String, dynamic>? headrs,
      Map<String, dynamic>? body,
      Map<String, dynamic>? qury}) async {
    final Response response = await dio.post(path,
        data: body, queryParameters: qury, options: Options(headers: headrs));

    return response;
  }
}
