class Menu {
  String libellee;
  String type;
  double prix;
  int stars;
  String image;
  int duree;
  static List<Menu> menuList;

  Menu({this.libellee, this.type, this.prix, this.stars, this.image, this.duree});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      libellee: json['libellee'] as String,
      type: json['type'] as String,
      prix: json['prix'].toDouble() as double,
      stars: json['stars'] as int,
      image: json['image'] as String,
      duree: json['duree'] as int,
    );
  }

  // Map<String, dynamic> toJson() =>
  //   {
  //     'id': id,
  //     'libellee': libellee,
  //     'type': type,
  //     'prix': prix,
  //     'stars': stars,
  //     'image': image,
  //   };
}
