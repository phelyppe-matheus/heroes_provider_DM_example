import 'package:flutter/material.dart';
import 'package:heroes_provider/hero_model.dart';

class HeroesControler extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: "Thor"),
    HeroModel(name: "Aquaman"),
    HeroModel(name: "Captain America"),
    HeroModel(name: "Batman"),
    HeroModel(name: "Flash"),
    HeroModel(name: "Hulk"),
  ];

  checkFavorite(HeroModel model) {
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}
