import 'package:duel_links_decks/pages/favorites/FavoritesPage.dart';
import 'package:duel_links_decks/pages/tier_list/TierListPage.dart';
import 'package:duel_links_decks/pages/top_decks/TopDecksPage.dart';
import 'package:duel_links_decks/widgets/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Widget _content = TierListPage();
  AnimationController _controller;

  @override
  void initState() {
    _controller = _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _controller.forward(from: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FadeTransition(
          opacity: _controller,
          child: _content,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        onItemSelected: (item){
          switch(item){
            case BottomNavigationItem.TIER_LIST:
              if(_content is TierListPage){
                return;
              }
              setState(() {
                _content = TierListPage();
              });
              _controller.forward(from: 0.0);
              break;
            case BottomNavigationItem.TOP_DECKS:
              if(_content is TopDecksPage){
                return;
              }
              setState(() {
                _content = TopDecksPage();
              });
              _controller.forward(from: 0.0);
              break;
            case BottomNavigationItem.FAVORITE:
              if(_content is FavoritesPage){
                return;
              }
              setState(() {
                _content = FavoritesPage();
              });
              _controller.forward(from: 0.0);
              break;
          }
        },
      ),
    );
  }

}
