import 'package:duel_links_decks/constants/CustomTheme.dart';
import 'package:duel_links_decks/pages/home/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        textTheme: CustomTheme.myTextTheme
      ),
      home: Home(),
    );
  }
}
