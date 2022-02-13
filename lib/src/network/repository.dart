import 'package:herald_book/src/network/models/vos/hero_vo.dart';
import 'package:herald_book/src/network/models/vos/match_vo.dart';
import 'package:herald_book/src/network/models/vos/player_vo.dart';
import 'package:herald_book/src/network/models/vos/win_lose_vo.dart';
import 'package:herald_book/src/network/models/vos/word_list_vo.dart';
import 'package:herald_book/src/network/source/api_source.dart';

abstract class Repository {
  Future<List<HeroVO>> getHeroList();
  Future<PlayerVO> getPlayerById(int id);
  Future<WinLoseVO> getWinLoseScore(int id);
  Future<String> getPlayerWordList(int id);
  Future<List<MatchVO>> getMatchList(int id);
}

class RepositoryImpl implements Repository {
  var _mSource = ApiSource();

  @override
  Future<List<HeroVO>> getHeroList() {
    return _mSource.publicApi().getHeroList();
  }

  @override
  Future<PlayerVO> getPlayerById(int id) {
    return _mSource.publicApi().getPlayerById(id);
  }

  @override
  Future<String> getPlayerWordList(int id) {
    return _mSource.publicApi().getWordList(id);
  }

  @override
  Future<WinLoseVO> getWinLoseScore(int id) {
    return _mSource.publicApi().getWinLoseScore(id);
  }

  @override
  Future<List<MatchVO>> getMatchList(int id) {
    return _mSource.publicApi().getMatchList(id);
  }
}
