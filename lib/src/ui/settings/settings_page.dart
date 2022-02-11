import 'package:fluent_ui/fluent_ui.dart';
import 'package:herald_book/src/app_utils/base_view_model.dart';
import 'package:herald_book/src/app_utils/locator.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController idController = TextEditingController();
  late SettingsProvider _settingsProvider;

  @override
  void initState() {
    _settingsProvider = locator<SettingsProvider>();
    if (_settingsProvider.isConnected) {
      setState(() {
        idController.text =
            _settingsProvider.playerVO!.profile?.accountId.toString() ?? 'no data';
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Consumer<SettingsProvider>(builder: (context, provider, child) {
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: TextBox(
                      enabled: !provider.isConnected,
                      controller: idController,
                      header: 'Steam Identity',
                      placeholder: 'Type your steam id here',
                      style: provider.isConnected
                          ? TextStyle(color: Colors.successPrimaryColor)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  SizedBox(
                    height: 30.0,
                    child: Button(
                      child: Center(child: Text('Bind')),
                      onPressed: !provider.isConnected
                          ? () {
                              provider.bind(idController.text);
                            }
                          : null,
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.0),
              handleWidget(provider)
            ]),
          ),
        );
      });
    });
  }

  Widget handleWidget(SettingsProvider provider) {
    if (provider.state == ViewState.LOADING) {
      return SizedBox(width: 15, height: 15, child: ProgressRing());
    } else if (provider.state == ViewState.COMPLETE) {
      return Icon(FluentIcons.completed, color: Colors.successPrimaryColor);
    } else if (provider.state == ViewState.ERROR) {
      return Icon(FluentIcons.error, color: Colors.errorPrimaryColor);
    } else {
      return SizedBox();
    }
  }
}
