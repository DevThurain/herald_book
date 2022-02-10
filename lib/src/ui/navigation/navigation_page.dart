import 'dart:html';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herald_book/src/ui/heros/heroes_page.dart';
import 'package:herald_book/src/ui/items/items_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentPage = 0;
  @override
  void initState() {
    print("navigation screen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      luminosityAlpha: 0.2,
      tint: Colors.red,
      child: NavigationView(
        appBar: NavigationAppBar(
          leading: SvgPicture.asset('assets/svgs/dota2.svg'),
          title: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              'Herald Book',
              style: TextStyle(
                fontFamily: 'Acient',
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Color.fromARGB(255, 35, 187, 35),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        pane: NavigationPane(
            selected: _currentPage,
            onChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.people),
                title: const Text('Heroes'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.test_beaker),
                title: const Text('Items'),
              ),
            ]),
        content: NavigationBody(
          index: _currentPage,
          children: [HeroesPage(), ItemsPage()],
        ),
      ),
    );
  }
}
