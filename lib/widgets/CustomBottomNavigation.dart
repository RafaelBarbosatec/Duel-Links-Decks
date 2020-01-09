import 'package:duel_links_decks/constants/CustomTheme.dart';
import 'package:flutter/material.dart';

enum BottomNavigationItem{
  TIER_LIST,
  TOP_DECKS,
  FAVORITE
}

class CustomBottomNavigation extends StatefulWidget {

  final Function(BottomNavigationItem) onItemSelected;

  const CustomBottomNavigation({Key key, this.onItemSelected}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  int _positionSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Tier List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          title: Text('Top Decks'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
        ),
      ],
      currentIndex: _positionSelected,
      backgroundColor: Theme.of(context).backgroundColor,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,

      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _positionSelected = value;
      if(widget.onItemSelected != null){
        switch(value){
          case 0: widget.onItemSelected(BottomNavigationItem.TIER_LIST);break;
          case 1: widget.onItemSelected(BottomNavigationItem.TOP_DECKS);break;
          case 2: widget.onItemSelected(BottomNavigationItem.FAVORITE);break;
        }
      }
    });
  }
}
