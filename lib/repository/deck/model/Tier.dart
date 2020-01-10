class Tier {
  String name;
  String img;
  String lastUpdate;

  Tier({this.name, this.img, this.lastUpdate});

  Tier.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['last_update'] = this.lastUpdate;
    return data;
  }

  @override
  String toString() {
    return 'Tier{name: $name, img: $img, lastUpdate: $lastUpdate}';
  }


}