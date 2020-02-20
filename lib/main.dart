import 'package:NewskeepyAlpha/pages/home/home_view.dart';
import 'package:NewskeepyAlpha/support/di/init_dependencies.dart';
import 'package:NewskeepyAlpha/support/localization/MyLocalizationsDelegate.dart';
import 'package:bsev/flavors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'support/di/init_dependencies.dart';

void main() => runApp(new NewsApp());

class NewsApp extends StatefulWidget {

  NewsApp() {
    Flavors.configure(Flavor.PROD);
    initDependencies();
  }

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  MyLocalizationsDelegate myLocation = const MyLocalizationsDelegate();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newskeepy Alpha',
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          accentColor: Colors.pink,
          brightness: Brightness.dark),
      supportedLocales: MyLocalizationsDelegate.supportedLocales(),
      localizationsDelegates: [
        myLocation,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: myLocation.resolution,
      home: HomeView(),
    );
  }
}
