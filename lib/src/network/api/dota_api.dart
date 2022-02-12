import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:herald_book/src/network/models/vos/hero_vo.dart';
import 'package:herald_book/src/network/models/vos/player_vo.dart';
import 'package:herald_book/src/network/models/vos/win_lose_vo.dart';
import 'package:herald_book/src/network/models/vos/word_list_vo.dart';
import 'package:retrofit/retrofit.dart';
import '../api_constants.dart';

part 'dota_api.g.dart';

@RestApi(baseUrl: ApiConstants.BASE_URL)
abstract class DotaAPI {
  factory DotaAPI(Dio dio) = _DotaAPI;

  @GET("/heroes")
  Future<List<HeroVO>> getHeroList();

  @GET("/players/{id}")
  Future<PlayerVO> getPlayerById(
    @Path("id") int id,
  );

  @GET("/players/{id}/wl")
  Future<WinLoseVO> getWinLoseScore(
    @Path("id") int id,
  );

  @GET("/players/{id}/wordcloud")
  Future<String> getWordList(
    @Path("id") int id,
  );
}
