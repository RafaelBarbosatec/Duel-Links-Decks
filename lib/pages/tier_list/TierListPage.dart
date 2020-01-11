import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/pages/tier_list/TierListBloc.dart';
import 'package:duel_links_decks/pages/tier_list/TierListStream.dart';
import 'package:duel_links_decks/repository/deck/model/ResponseTier.dart';
import 'package:duel_links_decks/repository/deck/model/Tier.dart';
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
    return Container();
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
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                      child: Text(
                        "Tier 1",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Theme.of(context).textSelectionColor,
                        ),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: response.tier1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 50.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                response.tier1[index].img))),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(response.tier1[index].name),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Ultima Atualização: ",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                        ),
                                        Text(response.tier1[index].lastUpdate)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                  child: Text(
                    "Tier 2",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Theme.of(context).textSelectionColor,
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: response.tier2.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 50.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            response.tier2[index].img))),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text(response.tier2[index].name),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Ultima Atualização: ",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                    ),
                                    Text(response.tier2[index].lastUpdate)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                  child: Text(
                    "Tier 3",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Theme.of(context).textSelectionColor,
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: response.tier3.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 50.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            response.tier3[index].img))),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text(response.tier3[index].name),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Ultima Atualização: ",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                    ),
                                    Text(response.tier3[index].lastUpdate)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                  child: Text(
                    "HighPotential",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Theme.of(context).textSelectionColor,
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: response.highPotential.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 50.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(response
                                            .highPotential[index].img))),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child:
                                      Text(response.highPotential[index].name),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Ultima Atualização: ",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                    ),
                                    Text(response
                                        .highPotential[index].lastUpdate)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
              ],
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
}
