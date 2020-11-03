import 'package:cocktail/core/models.dart';
import 'package:flutter/material.dart';
import './services/theme.dart';

import './ui/cocktail_detail_page.dart';
import './ui/filter_page.dart';

import './core/src/repository/async_cocktail_repository.dart';

void main() async {
  print('first');
  final cocktail = await AsyncCocktailRepository().getRandomCocktail();
  print('second');

  runApp(MyApp(cocktail));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Cocktail cocktail;
  MyApp(this.cocktail);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: cocktailTheme,
//      home: CocktailDetailPage(cocktail),
      home: CocktailDetailPage(cocktail),
    );
  }
}
