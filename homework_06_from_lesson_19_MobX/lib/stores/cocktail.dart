import 'package:cocktail_app/core/models.dart';
import 'package:flutter/animation.dart';
import 'package:mobx/mobx.dart';
part 'cocktail.g.dart';

// запуск на кодогенерацию:
// flutter pub run build_runner build --delete-conflicting-outputs

// создаем store:
class _CocktailImpl extends CocktailStore with _$_CocktailImpl {}

abstract class CocktailStore with Store {
  factory CocktailStore.create() => _CocktailImpl();
  CocktailStore();

  //будем хранить краткий сериализованный CocktailDefinition
  final favoriteCocktails = ObservableList<CocktailDefinition>();

  @action
  void removeItemFromFavorities(CocktailDefinition cocktail) =>
      favoriteCocktails.removeWhere((element) => element.id == cocktail.id);

  @action
  void addItemToFavorities(CocktailDefinition cocktail) =>
      favoriteCocktails.add(cocktail);

  @action
  void removeFromFavoritiesById(String id) =>
      favoriteCocktails.removeWhere((element) => element.id == id);

  @action
  void addToFavoritiesByCocktail(Cocktail cocktail) {
    CocktailDefinition currentCocktail = CocktailDefinition(
        id: cocktail.id,
        name: cocktail.name,
        drinkThumbUrl: cocktail.drinkThumbUrl,
        isFavourite: true);
    favoriteCocktails.add(currentCocktail);
  }

  @action
  bool isInFav(String cocktailId) {
    var contain =
        favoriteCocktails.where((element) => element.id == cocktailId);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @computed
  int get countFavorities => favoriteCocktails.length;
}
