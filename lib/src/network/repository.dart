import 'package:herald_book/src/network/models/vos/hero_vo.dart';
import 'package:herald_book/src/network/source/api_source.dart';

abstract class Repository {
  Future<List<HeroVO>> getHeroList();
}

class RepositoryImpl implements Repository{
     var  _mSource =  ApiSource();

  @override
  Future<List<HeroVO>> getHeroList() {
    return _mSource.publicApi().getHeroList();
  }

}
