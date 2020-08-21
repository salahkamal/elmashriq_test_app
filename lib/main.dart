import 'package:device_preview/device_preview.dart';
import 'package:elmashriqtestapp/localization/locales.dart';
import 'package:elmashriqtestapp/screens/home_page.dart';
import 'package:elmashriqtestapp/screens/login_page.dart';
import 'package:elmashriqtestapp/services/login_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(),
    // ),
    ChangeNotifierProvider<LoginService>(
      create: (BuildContext context) => LoginService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  static void setLocale(BuildContext ctx, Locale locale) {
    _MyAppState state = ctx.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder,
      locale: _locale,
      localizationsDelegates: [
        DemoLocalizations.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
