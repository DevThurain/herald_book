import 'package:fluent_ui/fluent_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Text(
          'Settings',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: TextBox(
                  controller: idController,
                  header: 'Steam Identity',
                  placeholder: 'Type your steam id here',
                ),
              ),
              SizedBox(width: 8.0),
              SizedBox(
                height: 30.0,
                child: Button(child: Center(child: Text('Bind')), onPressed: () {}))
            ],
          ),
        ]),
      ),
    );
  }
}
