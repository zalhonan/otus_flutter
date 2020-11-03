import 'package:flutter/material.dart';
import './services/theme.dart';

import './ui/cocktail_detail_page.dart';
import './ui/filter_page.dart';

import './core/src/repository/async_cocktail_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final cocktail = AsyncCocktailRepository().getRandomCocktail();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: cocktailTheme,
//      home: CocktailDetailPage(cocktail),
      home: CocktailsFilterScreen(),
    );
  }
}
