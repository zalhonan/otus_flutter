import 'package:cocktail_app/core/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cocktail_app/stores/cocktail.dart';

class CocktailTitle extends StatefulWidget {
  final Cocktail cocktail;

  CocktailTitle({this.cocktail});

  @override
  _CocktailTitleState createState() => _CocktailTitleState();
}

class _CocktailTitleState extends State<CocktailTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.cocktail.name ?? '',
          style: Theme.of(context).textTheme.headline3,
        ),
        _getIsFavoriteIcon(context)
      ],
    );
  }

  Widget _getIsFavoriteIcon(BuildContext context) {
    //обращение к стору, созданному на уровне приложения
    final store = Provider.of<CocktailStore>(context);

    if (store.isInFav(widget.cocktail.id)) {
      return IconButton(
        icon: Icon(Icons.favorite, color: Colors.white),
        onPressed: () {
          store.removeFromFavoritiesById(widget.cocktail.id);
          widget.cocktail.setUnfav();
          //TODO убрать
          print("--${store.countFavorities}--");
          setState(() {});
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border, color: Colors.white),
        onPressed: () {
          widget.cocktail.setFav();
          store.addToFavoritiesByCocktail(widget.cocktail);
          print("--${store.countFavorities}--");
          setState(() {});
        },
      );
    }
  }
}
