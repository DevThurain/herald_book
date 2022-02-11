import 'package:fluent_ui/fluent_ui.dart';

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
      content: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSectionView(),
            SizedBox(height: 12.0),
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
        ),
      ),
    );
  }
}

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              'https://images.unsplash.com/photo-1644417076004-591270852df9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2OHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              fit: BoxFit.cover,
            )),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nightt Sama',
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
