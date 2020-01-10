import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/pages/tier_list/TierListStream.dart';
import 'package:duel_links_decks/repository/deck/DecksRepository.dart';

class TierListBloc extends BlocBase<TierListStream>{

  final DecksRepository _decksRepository;

  TierListBloc(this._decksRepository);

  @override
  void eventReceiver(EventsBase event) {}

  @override
  void initView() {
    _loadTier();
  }

  void _loadTier() {
    streams.progress.set(true);
    _decksRepository.loadTierList().then((data){
      streams.tiers.set(data);
      streams.progress.set(false);
    }).catchError((error){
      print(error);
      streams.progress.set(false);
    });
  }

}