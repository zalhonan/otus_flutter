import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import '../services/colors.dart';
import '../widgets/cocktail_info.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=20%3A590
    ///для того что бы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: screenWidth,
                height: screenWidth,
                color: kCocktailBackground,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      cocktail.drinkThumbUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 26,
                      left: 28,
                      child: Icon(
                        Icons.arrow_back,
                        color: kHeaderColor,
                        size: 28,
                      ),
                    ),
                    Positioned(
                      top: 26,
                      right: 28,
                      child: Icon(
                        Icons.open_in_new,
                        color: kHeaderColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: kDescriptionBackground,
                padding: EdgeInsets.fromLTRB(33, 33, 33, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${cocktail.name}',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Icon(
                          cocktail.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      'id:${cocktail.id}',
                      style: TextStyle(
                        fontSize: 16,
                        color: kSubheaderColor,
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    CocktailInfo(
                        'Категория коктейля', '${cocktail.category.value}'),
                    CocktailInfo(
                        'Тип коктейля', '${cocktail.cocktailType.value}'),
                    CocktailInfo('Тип стекла', '${cocktail.glassType.value}'),
                  ],
                ),
              ),
              Text('${cocktail.ingredients.toList()[0].ingredientName}'),
              Text('${cocktail.ingredients.toList()[0].measure}'),
              Text('${cocktail.instruction.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
