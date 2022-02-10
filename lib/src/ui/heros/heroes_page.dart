import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  _HeroesPageState createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Text(
          'Heroes',
          style: TextStyle(
            fontFamily: 'Acient',
            fontSize: 16.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 180 / 135,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Hero();
              },
              childCount: 200,
            ),
          )
        ],
      ),
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                  "https://cdn.dota2.com/apps/dota2/images/heroes/axe_full.png")),
          const SizedBox(height: 8.0),
          const SizedBox(
            width: 180,
            child: Text(
              'Axe',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Acient',
                fontSize: 14.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
