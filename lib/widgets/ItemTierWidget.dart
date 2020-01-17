import 'package:duel_links_decks/repository/deck/model/Tier.dart';
import 'package:flutter/material.dart';

class ItemTierWidget extends StatelessWidget {

  final Tier item;

  const ItemTierWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 10.0, left: 10.0, right: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
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
                          item.img))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(item.name),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Ultima Atualização: ",
                    style: TextStyle(
                        color: Theme.of(context)
                            .secondaryHeaderColor),
                  ),
                  Text(item.lastUpdate)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                  ),
                  onPressed: () {},
                  child: Text("Detalhes"),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
