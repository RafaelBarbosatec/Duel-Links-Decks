import 'package:bsev/bsev.dart';
import 'package:bsev/flavors.dart';
import 'package:duel_links_decks/constants/CustomTheme.dart';
import 'package:duel_links_decks/di/injectSupport.dart';
import 'package:duel_links_decks/di/intectBlocs.dart';
import 'package:duel_links_decks/pages/home/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp(){
    Flavors.configure(Flavor.PROD);
    injectSupport(Injector.appInstance);
    injectBlocs(Injector.appInstance);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: CustomTheme.accent,
        primaryColor: CustomTheme.primary,
        backgroundColor: CustomTheme.content,
        scaffoldBackgroundColor: CustomTheme.primary,
        unselectedWidgetColor: CustomTheme.unselected,
        textTheme: CustomTheme.myTextTheme,
        secondaryHeaderColor: CustomTheme.green,
        textSelectionColor: CustomTheme.orange,
      ),
      home: Home(),
    );
  }
}
