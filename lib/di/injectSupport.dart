
import 'package:bsev/bsev.dart';
import 'package:bsev/flavors.dart';
import 'package:duel_links_decks/repository/deck/DecksRepository.dart';
import 'package:duel_links_decks/support/Con.dart';

injectSupport(Injector injector){

  injector.registerSingleton((i){

    Con _con;

    String base = "https://raw.githubusercontent.com/RafaelBarbosatec/Duel-Links-Decks/master/api/";

    switch(Flavors().getFlavor()){
      case Flavor.PROD: _con = Con(base); break;
      case Flavor.HOMOLOG: _con = Con(base,debug: true); break;
      case Flavor.DEBUG: _con = Con(base,debug: true);
    }

    return _con;

  });

  injector.registerDependency<DecksRepository>((i)=> DeckRepositoryImpl(i.getDependency()));

}
