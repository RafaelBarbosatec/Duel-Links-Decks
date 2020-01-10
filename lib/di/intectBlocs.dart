import 'package:bsev/bsev.dart';
import 'package:duel_links_decks/pages/tier_list/TierListBloc.dart';
import 'package:duel_links_decks/pages/tier_list/TierListStream.dart';

injectBlocs(Injector injector){
  injector.registerDependency((i)=> TierListBloc(i.getDependency()));
  injector.registerDependency((i)=> TierListStream());

}