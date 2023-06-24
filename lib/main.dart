import 'package:flutter/material.dart';
import 'package:news_app/pages/details_screen/details_screen.dart';
import 'package:news_app/pages/details_screen/web_view.dart';
import 'package:news_app/pages/home/home_page.dart';
import 'package:news_app/pages/splash_screen/splash_screen.dart';
import 'package:news_app/provider/setting_provider.dart';
import 'package:news_app/shared_components/theme/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => SettingProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLocal),
      theme: MyTheme.LightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SplashScreen.routeName: (context) => SplashScreen(),
        DetailsScreen.routeName:(context) => DetailsScreen(),
        WebView.routeName:(context) => WebView(),
      },
    );
  }
}
