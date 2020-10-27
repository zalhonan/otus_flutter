import 'package:flutter/material.dart';
import './services/theme.dart';

import './screens/cocktail_detail_page.dart';
import './models/src/repository/sync_cocktail_repository.dart';

void main() {
  final cocktail = SyncCocktailRepository().getHomeworkCocktail();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      home: MaterialApp(
        home: CocktailDetailPage(cocktail),
        theme: cocktailTheme,
      ),
    ),
  );
}
