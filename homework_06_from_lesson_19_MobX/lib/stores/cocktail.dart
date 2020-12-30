import 'package:cocktail_app/core/models.dart';
import 'package:mobx/mobx.dart';
part 'cocktail.g.dart';

// запуск на кодогенерацию:
// flutter pub run build_runner build --delete-conflicting-outputs

// создаем store:
class _CocktailImpl extends CocktailStore with _$_CocktailImpl {}

abstract class CocktailStore with Store {
  factory CocktailStore.create() => _CocktailImpl();
  CocktailStore();

  final favoriteCocktails = ObservableList<Cocktail>();

  @action
  void addItemToFavorities(Cocktail cocktail) =>
      favoriteCocktails.add(cocktail);

  @action
  void removeItemFromFavorities(Cocktail cocktail) =>
      favoriteCocktails.remove(cocktail);

  @computed
  int get countFavorities => favoriteCocktails.length;
}
