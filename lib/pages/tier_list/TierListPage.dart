import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/pages/tier_list/TierListBloc.dart';
import 'package:duel_links_decks/pages/tier_list/TierListStream.dart';
import 'package:duel_links_decks/repository/deck/model/ResponseTier.dart';
import 'package:duel_links_decks/repository/deck/model/Tier.dart';
import 'package:duel_links_decks/widgets/ItemTierWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TierListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bsev<TierListBloc, TierListStream>(
        builder: (context, dispatcher, streams) {
      return Stack(
        children: <Widget>[
          _buildBg(context),
          _buildList(context, streams),
          _buildProgress(context, streams)
        ],
      );
    });
  }

  Widget _buildBg(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/home.png',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 1],
                  colors: [Colors.transparent, Colors.black])
          ),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context, TierListStream streams) {
    return StreamBuilder(
      stream: streams.tiers.get,
      builder: (context, snapshot) {
        ResponseTier response;

        if (snapshot.hasData) {
          response = snapshot.data;
          return SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildContentList(context,response),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildProgress(BuildContext context, TierListStream streams) {
    return StreamBuilder(
      stream: streams.progress.get,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }

  List<Widget> _buildContentList(BuildContext context, ResponseTier response){
    List<Widget> list = List();

    list.add(_buildCategory("Tier 1",context));

    list.addAll(response.tier1.map((item){
      return ItemTierWidget(item: item,);
    }).toList());

    list.add(_buildCategory("Tier 2",context));

    list.addAll(response.tier2.map((item){
      return ItemTierWidget(item: item,);
    }).toList());

    list.add(_buildCategory("Tier 3",context));

    list.addAll(response.tier3.map((item){
      return ItemTierWidget(item: item,);
    }).toList());

    list.add(_buildCategory("Hight Potential",context));

    list.addAll(response.highPotential.map((item){
      return ItemTierWidget(item: item,);
    }).toList());

    return list;

  }

  Widget _buildCategory(String text,BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border:  Border.all(
          width: 1, //
          color: Colors.orange//                  <--- border width here
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }
}
