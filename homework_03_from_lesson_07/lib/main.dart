import 'package:cocktail/core/models.dart';
import 'package:cocktail/screens/cocktail_detail_builder_random.dart';
import 'package:flutter/material.dart';
import './services/theme.dart';

import './screens/cocktail_detail_page.dart';
import './screens/filter_page.dart';

import './core/src/repository/async_cocktail_repository.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: cocktailTheme,
      home: CocktailsFilterScreen(),
    );
  }
}
