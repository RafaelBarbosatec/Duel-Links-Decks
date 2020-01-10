import 'package:duel_links_decks/repository/deck/model/Tier.dart';

class ResponseTier {
  List<Tier> tier1;
  List<Tier> tier2;
  List<Tier> tier3;
  List<Tier> highPotential;

  ResponseTier({this.tier1, this.tier2, this.tier3, this.highPotential});

  ResponseTier.fromJson(Map<String, dynamic> json) {
    if (json['tier1'] != null) {
      tier1 = new List<Tier>();
      json['tier1'].forEach((v) {
        tier1.add(new Tier.fromJson(v));
      });
    }
    if (json['tier2'] != null) {
      tier2 = new List<Tier>();
      json['tier2'].forEach((v) {
        tier2.add(new Tier.fromJson(v));
      });
    }
    if (json['tier3'] != null) {
      tier3 = new List<Tier>();
      json['tier3'].forEach((v) {
        tier3.add(new Tier3.fromJson(v));
      });
    }
    if (json['highPotential'] != null) {
      highPotential = new List<HighPotential>();
      json['highPotential'].forEach((v) {
        highPotential.add(new HighPotential.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tier1 != null) {
      data['tier1'] = this.tier1.map((v) => v.toJson()).toList();
    }
    if (this.tier2 != null) {
      data['tier2'] = this.tier2.map((v) => v.toJson()).toList();
    }
    if (this.tier3 != null) {
      data['tier3'] = this.tier3.map((v) => v.toJson()).toList();
    }
    if (this.highPotential != null) {
      data['highPotential'] =
          this.highPotential.map((v) => v.toJson()).toList();
    }
    return data;
  }
}