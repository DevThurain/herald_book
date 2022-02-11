import 'package:get_it/get_it.dart';
import 'package:herald_book/src/view_model/heroes_provider.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';


GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerFactory(() => HeroesProvider());
  locator.registerFactory(() => SettingsProvider());


}
