
import 'dart:convert';

import 'package:duel_links_decks/repository/deck/model/Tier.dart';
import 'package:duel_links_decks/repository/deck/model/ResponseTier.dart';
import 'package:duel_links_decks/support/Con.dart';

abstract class DecksRepository{
  Future<ResponseTier> loadTierList();
}

class DeckRepositoryImpl implements DecksRepository{

  final Con _con;
  DeckRepositoryImpl(this._con);

  @override
  Future<ResponseTier> loadTierList() async {
    String jsonString = await _con.get("tier.json");
    Map userMap = jsonDecode(jsonString);
    return ResponseTier.fromJson(userMap);
  }

}