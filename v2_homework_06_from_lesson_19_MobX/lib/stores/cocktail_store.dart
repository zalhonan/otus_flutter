import 'package:cocktail_app/core/models.dart';
import 'package:mobx/mobx.dart';

part 'cocktail_store.g.dart';

// запуск на кодогенерацию:
// flutter pub run build_runner build --delete-conflicting-outputs

// создаем store:
class _CocktailImpl extends CocktailStore with _$_CocktailImpl {}

abstract class CocktailStore with Store {
  factory CocktailStore.create() => _CocktailImpl();
  CocktailStore();

  final repository = AsyncCocktailRepository();

  //работа со списком коктейлей по категориям

  //лист текущих запрошенных коктейлей CocktailDefinition
  @observable
  List<CocktailDefinition> currentCocktails = [];

  //текущая категория коктейлей на странице "фильтр"
  @observable
  CocktailCategory currentCategory = CocktailCategory.ordinaryDrink;

  //пустой лист для сравнения
  static ObservableFuture<List<CocktailDefinition>> emptyCocktailList =
      ObservableFuture.value([]);

  //fetchCocktailsFuture - Future для запроса коктейлей. начинаем с чистого.
  @observable
  ObservableFuture<List<CocktailDefinition>> fetchCocktailsFuture =
      emptyCocktailList;

  //считаем, есть ли результат по запросу
  @computed
  bool get hasResults =>
      fetchCocktailsFuture != emptyCocktailList &&
      fetchCocktailsFuture.status == FutureStatus.fulfilled;

  //запрос к сети - коктейли по текущей категории
  Future<List<CocktailDefinition>> fetchCocktails() async {
    final future = repository.fetchCocktailsByCocktailCategory(
        currentCategory, favoritiesIds);
    fetchCocktailsFuture = ObservableFuture(future);
    return currentCocktails = await future;
  }

  //установить новую категорию коктейлей
  @action
  void setCategory(CocktailCategory newCategory) {
    fetchCocktailsFuture = emptyCocktailList;
    currentCategory = newCategory;
    fetchCocktails();
  }

  //TODO: переделка по MobX по полному инфо коктейля - cock_detail_loader_page + cock_detail_page
  @observable
  Cocktail currentCocktail = Cocktail(
      id: null,
      name: null,
      instruction: null,
      category: null,
      glassType: null,
      cocktailType: null,
      ingredients: null,
      drinkThumbUrl: null,
      isFavourite: null);

  @observable
  String currentCocktailId = '';

  //TODO: Работа по рандомному коктейлю - random_cock_page

  // Все, что связано с избранным

  //лист избранного
  @observable
  List<CocktailDefinition> favoriteCocktails = [];

  //computed - список ID коктейлей в избранном
  @computed
  List<String> get favoritiesIds {
    List<String> res = [];
    for (CocktailDefinition currentCocktail in favoriteCocktails) {
      res.add(currentCocktail.id);
    }
    return res;
  }

  @action
  void addItemToFavorities(CocktailDefinition cocktail) =>
      favoriteCocktails.add(cocktail);

  @action
  void removeFromFavoritiesById(String id) =>
      favoriteCocktails.removeWhere((element) => element.id == id);

  // добавляет в фав по коктейлю, на лету конвертируя в cocktailDefinition
  @action
  void addToFavoritiesByCocktail(Cocktail cocktail) {
    CocktailDefinition currentCocktail = CocktailDefinition(
        id: cocktail.id,
        name: cocktail.name,
        drinkThumbUrl: cocktail.drinkThumbUrl,
        isFavourite: true);
    favoriteCocktails.add(currentCocktail);
  }

  @computed
  int get countFavorities => favoriteCocktails.length;
}
