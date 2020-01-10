import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/repository/deck/model/ResponseTier.dart';
import 'package:duel_links_decks/repository/deck/model/Tier.dart';

class TierListStream extends StreamsBase{

  var progress = BehaviorSubjectCreate<bool>();
  var tiers = BehaviorSubjectCreate<ResponseTier>();

  @override
  void dispose() {
    progress.close();
    tiers.close();
  }

}