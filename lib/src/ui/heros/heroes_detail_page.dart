import 'package:fluent_ui/fluent_ui.dart';

class HeroesDetailPage extends StatefulWidget {
  static const routeName = '/hero_detail_screen';
  const HeroesDetailPage({Key? key}) : super(key: key);

  @override
  _HeroesDetailPageState createState() => _HeroesDetailPageState();
}

class _HeroesDetailPageState extends State<HeroesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Text("Hero Details"),
      content: Container(
      ),
    );
  }
}
