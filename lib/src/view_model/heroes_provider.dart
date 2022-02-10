import 'package:herald_book/src/app_utils/base_view_model.dart';
import 'package:herald_book/src/network/models/vos/hero_vo.dart';
import 'package:herald_book/src/network/repository.dart';

class HeroesProvider extends BaseViewModel {
  List<HeroVO>? heroList;

  final RepositoryImpl _repositoryImpl = RepositoryImpl();

  HeroesProvider() {
    getHeroList();
  }

  void getHeroList() {
    setState(ViewState.LOADING);
    try {
      _repositoryImpl.getHeroList().then((list) {
        heroList = list;
        setState(ViewState.COMPLETE);
      }).onError((error, stackTrace) {
        setState(ViewState.ERROR);
      });
    } catch (e) {
      setState(ViewState.ERROR);
    }
  }

  String getImageLink(String rawName) {
    return rawName.replaceAll('npc_dota_hero_', '');
  }
}
