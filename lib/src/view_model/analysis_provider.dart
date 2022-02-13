import 'package:herald_book/src/app_utils/chart_utils.dart';
import 'package:herald_book/src/app_utils/json_utils.dart';
import 'package:herald_book/src/network/models/vos/match_vo.dart';
import 'package:herald_book/src/network/models/vos/message_vo.dart';
import 'package:herald_book/src/network/models/vos/win_lose_vo.dart';
import 'package:herald_book/src/network/repository.dart';
import '../app_utils/base_view_model.dart';
import 'package:fl_chart/fl_chart.dart';


class AnalysisProvider extends BaseViewModel {
  WinLoseVO? winLoseVO;
  List<MessageVO> messageList = [];
  List<MatchVO> matchList = [];
  List<FlSpot> spotList = [];

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

  void getMatchList(int id) {
    messageList.clear();
    notifyListeners();
    try {
      _repositoryImpl.getMatchList(id).then((matches) {
        spotList = ChartUtils.calculateScore(matches);
        notifyListeners();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
