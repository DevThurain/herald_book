import 'package:herald_book/src/app_utils/json_utils.dart';
import 'package:herald_book/src/app_utils/locator.dart';
import 'package:herald_book/src/network/models/vos/message_vo.dart';
import 'package:herald_book/src/network/models/vos/win_lose_vo.dart';
import 'package:herald_book/src/network/models/vos/word_list_vo.dart';
import 'package:herald_book/src/network/repository.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';
import '../app_utils/base_view_model.dart';
import 'dart:convert';

class AnalysisProvider extends BaseViewModel {
  WinLoseVO? winLoseVO;
  List<MessageVO> messageList = [];
  SettingsProvider settingsProvider = locator<SettingsProvider>();

  final RepositoryImpl _repositoryImpl = RepositoryImpl();

  void getWinLoseScore(int id) {
    try {
      _repositoryImpl.getWinLoseScore(id).then((list) {
        winLoseVO = list;
        notifyListeners();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void getWrodList(int id) {
    messageList.clear();
    notifyListeners();
    try {
      _repositoryImpl.getPlayerWordList(id).then((rawData) {
        var result = rawData;
        messageList = JsonUtils.getMessages(result);
        notifyListeners();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
