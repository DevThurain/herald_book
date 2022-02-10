import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:herald_book/src/network/models/vos/hero_vo.dart';
import 'package:retrofit/retrofit.dart';
import '../api_constants.dart';

part 'dota_api.g.dart';

@RestApi(baseUrl: ApiConstants.BASE_URL)
abstract class DotaAPI {
  factory DotaAPI(Dio dio) = _DotaAPI;


  @GET("/heroes")
  Future<List<HeroVO>> getHeroList();

}
