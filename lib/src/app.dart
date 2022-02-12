import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herald_book/src/app_utils/locator.dart';
import 'package:herald_book/src/ui/heros/heroes_detail_page.dart';
import 'package:herald_book/src/ui/navigation/navigation_page.dart';
import 'package:herald_book/src/view_model/settings_provider.dart';
import 'settings/settings_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
 MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  SettingsProvider _settingsProvider = locator<SettingsProvider>();

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => _settingsProvider,
          child: FluentApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            theme: ThemeData(),
            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            // theme: ThemeData(),
             darkTheme: ThemeData.dark(),


            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            home: const NavigationPage(),
            onGenerateRoute: (routeSettings) {
              return FluentPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case HeroesDetailPage.routeName:
                      return HeroesDetailPage();

                    default:
                      return const NavigationPage();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
