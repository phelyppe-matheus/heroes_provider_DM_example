import 'package:flutter/material.dart';
import 'package:heroes_provider/hero_model.dart';
import 'package:heroes_provider/heroes_controller.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HeroesControler heroesControler = Provider.of<HeroesControler>(context);

    return ListView.builder(
      itemCount: heroesControler.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesControler.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesControler heroesControler = Provider.of<HeroesControler>(context);

    return ListTile(
      onTap: () {
        heroesControler.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(
              Icons.star,
              color: Colors.green.shade600,
            )
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        leading: Consumer<HeroesControler>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                "${heroesController.heroes.where((i) => i.isFavorite).length}",
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        ),
      ),
      body: Consumer<HeroesControler>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
