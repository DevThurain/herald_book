import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:herald_book/src/network/api/dota_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiSource {
  late Dio dio;
  late DotaAPI mApi;

  static final ApiSource _singleton = ApiSource.internal();

  factory ApiSource() {
    return _singleton;
  }

  ApiSource.internal() {
    dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  DotaAPI publicApi() {
    dio.options.headers = {
      "Content-Type": Headers.jsonContentType,
      "Accept": Headers.jsonContentType,
      // "X-API-TOKEN": "ZBJ3MafcVGQvEdCYPfGT",
    };

    mApi = DotaAPI(dio);

    return mApi;
  }

  // WisdomAPI privateApi() {
  //   late final SharedPreferenceHelper _pref = locator<SharedPreferenceHelper>();
  //   String token = _pref.getString(PREF_AUTH_TOKEN);
  //   print("token =>" + token);

  //   dio.options.headers = {
  //     "Content-Type": Headers.jsonContentType,
  //     "Accept": Headers.jsonContentType,
  //     "X-API-TOKEN": "ZBJ3MafcVGQvEdCYPfGT",
  //     "Authorization": "Bearer " + token
  //   };

  //   mApi = WisdomAPI(dio);
  //   return mApi;
  // }
}
