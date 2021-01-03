import 'package:cocktail_app/core/models.dart';
import 'package:cocktail_app/ui/pages/cocktail_details_loader_page.dart';
import 'package:cocktail_app/ui/style/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cocktail_app/stores/cocktail.dart';

class CocktailGridItem extends StatefulWidget {
  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;

  final CocktailCategory selectedCategory;

  CocktailGridItem(this.cocktailDefinition, {Key key, this.selectedCategory})
      : super(key: key);

  @override
  _CocktailGridItemState createState() => _CocktailGridItemState();
}

class _CocktailGridItemState extends State<CocktailGridItem> {
  @override
  Widget build(BuildContext context) {
    //обращение к стору, созданному на уровне приложения
    final store = Provider.of<CocktailStore>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => CocktailDetailsLoaderPageWidget(
                cocktailId: widget.cocktailDefinition.id),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.44, 0.94],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(14, 13, 19, 0),
                        Color(0xFF0E0D13)
                      ])),
              position: DecorationPosition.foreground,
              child: Image.network(
                widget.cocktailDefinition.drinkThumbUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _getIsFavoriteIcon(context),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.cocktailDefinition.name ?? '',
                      style: Theme.of(context).textTheme.bodyText1),
                  FittedBox(
                    child: Chip(
                      backgroundColor: CustomColors.black,
                      label: Text(widget.selectedCategory.name,
                          style: Theme.of(context).textTheme.caption),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getIsFavoriteIcon(context) {
    //обращение к стору, созданному на уровне приложения
    final store = Provider.of<CocktailStore>(context);

    if (widget.cocktailDefinition.isFavourite) {
      return IconButton(
        icon: Icon(Icons.favorite, color: Colors.white),
        onPressed: () {
          //логика удаления из избранного
          store.removeItemFromFavorities(widget.cocktailDefinition);
          widget.cocktailDefinition.switchFav();
          //TODO: убрать отладку
          print(
              "---removed---${widget.cocktailDefinition}.id---now fav---$store.countFavorities");
          setState(() {});
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border, color: Colors.white),
        onPressed: () {
          //логика добавления в избранноге
          store.addItemToFavorities(widget.cocktailDefinition);
          widget.cocktailDefinition.switchFav();
          //TODO: убрать отладку
          print(
              "---added---${widget.cocktailDefinition.id}---now fav---${store.countFavorities}");
          setState(() {});
        },
      );
    }
  }
}
