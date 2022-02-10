import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({ Key? key }) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return const NavigationView(
      appBar: NavigationAppBar(

      ),
      
    );
  }
}