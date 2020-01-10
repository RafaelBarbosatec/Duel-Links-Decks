import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/pages/tier_list/TierListBloc.dart';
import 'package:duel_links_decks/pages/tier_list/TierListStream.dart';
import 'package:duel_links_decks/repository/deck/model/ResponseTier.dart';
import 'package:duel_links_decks/repository/deck/model/Tier.dart';
import 'package:flutter/material.dart';

class TierListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bsev<TierListBloc,TierListStream>(
        builder: (context,dispatcher,streams){
          return Stack(
            children: <Widget>[
              _buildBg(context),
              _buildList(context,streams),
              _buildProgress(context,streams)
            ],
          );
        }
    );
  }

  Widget _buildBg(BuildContext context) {
    return Container();
  }

  Widget _buildList(BuildContext context, TierListStream streams) {
    return StreamBuilder(
      stream: streams.tiers.get,
      builder: (context,snapshot){

        ResponseTier response;

        if(snapshot.hasData){
          response = snapshot.data;
          return Column(
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.tier1.length,
                  itemBuilder: (context,index){
                    return Text(response.tier1[index].name);
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.tier2.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.0,left: 10.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor
                        ),
                        child: Text(response.tier2[index].name)
                    );
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.tier3.length,
                  itemBuilder: (context,index){
                    return Text(response.tier3[index].name);
                  }
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: response.highPotential.length,
                  itemBuilder: (context,index){
                    return Text(response.highPotential[index].name);
                  }
              )
            ],
          );
        }else{
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
}
