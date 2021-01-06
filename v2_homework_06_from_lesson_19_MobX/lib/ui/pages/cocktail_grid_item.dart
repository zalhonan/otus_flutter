import 'package:cocktail_app/core/models.dart';
import 'package:cocktail_app/ui/pages/cocktail_details_loader_page.dart';
import 'package:cocktail_app/ui/style/custom_colors.dart';
import 'package:flutter/material.dart';

class CocktailGridItem extends StatelessWidget {
  static const double aspectRatio = 170 / 215;

  final CocktailDefinition cocktailDefinition;

  final CocktailCategory selectedCategory;

  const CocktailGridItem(this.cocktailDefinition,
      {Key key, this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => CocktailDetailsLoaderPageWidget(
                cocktailId: cocktailDefinition.id),
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
                cocktailDefinition.drinkThumbUrl ?? '',
                fit: BoxFit.cover,
              ),
            ),
            // редизайн - иконка отнесения в избранное перенесена вверх и вправо
            Positioned(
              top: 0,
              right: 0,
              child: _getIsFavoriteIcon(false),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cocktailDefinition.name ?? '',
                      style: Theme.of(context).textTheme.bodyText1),
                  // редизайн - тег коктейля вылезал за край, вместе с иконкой был слишком мелким
                  FittedBox(
                    child: Chip(
                      backgroundColor: CustomColors.black,
                      label: Text(selectedCategory.name,
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

  Widget _getIsFavoriteIcon(bool isFavourite) {
    if (isFavourite) {
      return IconButton(
        icon: Icon(Icons.favorite, color: Colors.white),
        onPressed: () {},
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border, color: Colors.white),
        onPressed: () {},
      );
    }
  }
}
