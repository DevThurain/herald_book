import 'package:herald_book/src/app_utils/base_view_model.dart';
import 'package:herald_book/src/network/models/vos/player_vo.dart';
import 'package:herald_book/src/network/repository.dart';

class SettingsProvider extends BaseViewModel {
  bool isConnected = false;
  PlayerVO? playerVO;

  final RepositoryImpl _repositoryImpl = RepositoryImpl();

  SettingsProvider() {
    setState(ViewState.NONE);
  }

  void bind(String id) {
    setState(ViewState.LOADING);
    int numberId = int.parse(id);
    try {
      _repositoryImpl.getPlayerById(numberId).then((player) {
        playerVO = player;
        if (playerVO!.profile != null) {
          isConnected = true;
          setState(ViewState.COMPLETE);
        } else {
          isConnected = false;
          setState(ViewState.ERROR);
        }
      }).onError((error, stackTrace) {
        isConnected = false;
        setState(ViewState.ERROR);
      });
    } catch (e) {
      setState(ViewState.ERROR);
    }
  }

  void unbind() {
    playerVO = null;
    isConnected = false;
    setState(ViewState.NONE);
  }
}
