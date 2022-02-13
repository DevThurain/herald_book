import 'package:fluent_ui/fluent_ui.dart';
import 'package:herald_book/src/app_utils/chart_utils.dart';
import 'package:herald_book/src/app_utils/locator.dart';
import 'package:herald_book/src/network/models/vos/message_vo.dart';
import 'package:herald_book/src/view_model/analysis_provider.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late AnalysisProvider _analysisProvider;

  @override
  void initState() {
    _analysisProvider = locator<AnalysisProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _analysisProvider,
      child: Consumer<SettingsProvider>(builder: (context, provider, child) {
        return ScaffoldPage(
          header: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              'Analysis',
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: handleWidget(provider, _analysisProvider),
        );
      }),
    );
  }

  Widget handleWidget(SettingsProvider provider, AnalysisProvider analysisProvider) {
    if (provider.isConnected) {
      analysisProvider.getWinLoseScore(provider.playerVO?.profile?.accountId! ?? 0);
      analysisProvider.getWrodList(provider.playerVO?.profile?.accountId! ?? 0);
      analysisProvider.getMatchList(provider.playerVO?.profile?.accountId! ?? 0);

      return Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSectionView(
                name: provider.playerVO?.profile?.personaname.toString() ?? '',
                imageLink: provider.playerVO?.profile?.avatarfull.toString() ?? '',
              ),
              SizedBox(height: 12.0),
              Consumer<AnalysisProvider>(builder: (context, provider, child) {
                if (provider.messageList.isNotEmpty) {
                  return ChatMessageSectionView(messageList: analysisProvider.messageList);
                } else {
                  return SizedBox();
                }
              }),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Matches (WL Graph)',
                        style: TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Consumer<AnalysisProvider>(builder: (context, provider, child) {
                        if (provider.spotList.isNotEmpty) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 200,
                            child: LineChart(ChartUtils().mainData(provider.spotList)),
                          );
                        } else {
                          return SizedBox();
                        }
                      })
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('analysis_intro.gif', width: 100, height: 100),
            SizedBox(height: 12.0),
            Text('Please bind your id in setting.')
          ],
        ),
      );
    }
  }
}

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    Key? key,
    required this.name,
    required this.imageLink,
  }) : super(key: key);

  final String imageLink;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              imageLink,
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              fit: BoxFit.cover,
            )),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Matches',
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 8.0),
            Consumer<AnalysisProvider>(builder: (context, analysisProvider, child) {
              return WinLoseScoreSection(
                win: analysisProvider.winLoseVO?.win.toString() ?? '-',
                lose: analysisProvider.winLoseVO?.lose.toString() ?? '-',
              );
            })
          ],
        )
      ],
    );
  }
}

class WinLoseScoreSection extends StatelessWidget {
  WinLoseScoreSection({
    Key? key,
    required this.win,
    required this.lose,
  }) : super(key: key);

  String win;
  String lose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 8, height: 8, color: Colors.successPrimaryColor),
        SizedBox(width: 4),
        Text(
          win,
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(width: 12.0),
        Container(width: 8, height: 8, color: Colors.errorPrimaryColor),
        SizedBox(width: 4),
        Text(
          lose,
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

class ChatMessageSectionView extends StatelessWidget {
  const ChatMessageSectionView({Key? key, required this.messageList}) : super(key: key);
  final List<MessageVO> messageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favourite Chat Messages',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
          children: messageList.map((message) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Chip.selected(
                  text: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Text(message.word),
                    SizedBox(width: 18.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          message.count,
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            );
          }).toList(),
        )
      ],
    );
  }
}
