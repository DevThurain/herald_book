import 'dart:html';
import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:herald_book/src/app_utils/base_view_model.dart';
import 'package:herald_book/src/ui/heros/heroes_detail_page.dart';
import 'package:herald_book/src/view_model/heroes_provider.dart';
import 'package:provider/provider.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({Key? key}) : super(key: key);

  @override
  _HeroesPageState createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  final autoSuggestBox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HeroesProvider(),
      child: ScaffoldPage(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Heroes',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<HeroesProvider>(builder: (context, provier, child) {
                if (provier.state == ViewState.COMPLETE) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 30,
                    child: AutoSuggestBox(
                      controller: autoSuggestBox,
                      items: provier.heroList!
                          .map((hero) => hero.localizedName.toString())
                          .toList(),
                      onChanged: (value, reason) {},
                    ),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 40,
                    child: AutoSuggestBox(
                      controller: autoSuggestBox,
                      items: [],
                    ),
                  );
                }
              })
            ],
          ),
        ),
        content: Builder(builder: (context) {
          return Consumer<HeroesProvider>(
            builder: (context, provider, child) => handlingWidget(provider),
          );
        }),
      ),
    );
  }

  Widget handlingWidget(HeroesProvider provider) {
    if (provider.state == ViewState.COMPLETE) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: CustomScrollView(
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
                  return Hero(
                    name: provider.heroList![index].localizedName.toString(),
                    imageLink:
                        provider.getImageLink(provider.heroList![index].name.toString()),
                  );
                },
                childCount: provider.heroList?.length,
              ),
            )
          ],
        ),
      );
    } else if (provider.state == ViewState.LOADING) {
      return const Center(
        child: ProgressRing(),
      );
    } else if (provider.state == ViewState.ERROR) {
      return const Center(
        child: Text('Error'),
      );
    } else {
      return const Center(
        child: Text('Unknown State'),
      );
    }
  }
}

class Hero extends StatefulWidget {
  const Hero({
    Key? key,
    required this.name,
    required this.imageLink,
  }) : super(key: key);

  final String name;
  final String imageLink;

  @override
  State<Hero> createState() => _HeroState();
}

class _HeroState extends State<Hero> {
  bool enableBorder = false;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HeroesDetailPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween<double>(begin: 0.0, end: 1.0);

        return DrillInPageTransition(
          animation: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return material.InkWell(
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            enableBorder = true;
          });
        } else {
          setState(() {
            enableBorder = false;
          });
        }
      },
      onTap: () {
        Navigator.push(context, _createRoute());
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  "https://cdn.dota2.com/apps/dota2/images/heroes/${widget.imageLink}_full.png",
                  fit: BoxFit.cover,
                  errorBuilder: ((context, error, stackTrace) =>
                      Icon(FluentIcons.photo)),
                )),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 180,
              child: Text(
                widget.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
