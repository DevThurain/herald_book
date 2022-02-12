import 'package:fluent_ui/fluent_ui.dart';
import 'package:herald_book/src/app_utils/chart_utils.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  final wordList = [
    'ggez',
    'thanks',
    'help',
    'dog',
    'run',
    'noobs',
    'ggez',
    'thanks',
    'help',
    'dog',
    'run',
    'noobs',
    'ggez',
    'thanks',
    'help',
    'dog',
    'run',
    'noobs',
    'ggez',
    'thanks',
    'help',
    'dog',
    'run',
    'noobs',
    'ggez',
    'thanks',
    'help',
    'dog',
    'run',
    'noobs'
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, provider, child) {
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
        content: handleWidget(provider),
      );
    });
  }

  Widget handleWidget(SettingsProvider provider) {
    if (provider.isConnected) {
      return Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSectionView(
              name: provider.playerVO?.profile?.personaname.toString() ?? '',
              imageLink:  provider.playerVO?.profile?.avatarfull.toString() ?? '',
            ),
            SizedBox(height: 12.0),
            ChatMessageSectionView(wordList: wordList),
            SizedBox(height: 16.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Matches',
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      width: 500,
                      height: 200,
                      child: LineChart(ChartUtils().mainData()),
                    )
                  ],
                )
              ],
            )
          ],
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
            Row(
              children: [
                Container(width: 8, height: 8, color: Colors.successPrimaryColor),
                SizedBox(width: 4),
                Text(
                  '100',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(width: 12.0),
                Container(width: 8, height: 8, color: Colors.errorPrimaryColor),
                SizedBox(width: 4),
                Text(
                  '90',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class ChatMessageSectionView extends StatelessWidget {
  const ChatMessageSectionView({Key? key, required this.wordList}) : super(key: key);
  final List<String> wordList;

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
          children: wordList.map((word) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Chip.selected(
                  text: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Text(word),
                    SizedBox(width: 12.0),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '11',
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
