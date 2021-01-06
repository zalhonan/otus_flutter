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

  //лист текущих запрошенных коктейлей CocktailDefinition
  @observable
  List<CocktailDefinition> currentCocktails = [];

  //лист избранного
  @observable
  List<CocktailDefinition> favorities = [];

  //текущая категория коктейлей на странице "фильтр"
  @observable
  CocktailCategory currentCategory = CocktailCategory.ordinaryDrink;

  //computed - список ID коктейлей в избранном
  @computed
  List<String> get favoritiesIds {
    List<String> res = [];
    for (CocktailDefinition currentCocktail in favorities) {
      res.add(currentCocktail.id);
    }
    return res;
  }

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
    final future = repository.fetchCocktailsByCocktailCategory(currentCategory);
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

  //запрос к сети по полному инфо по коктейлю

  //добавить коктейль в избранное
  //удалить кок из избранного по ID - removeFromFavoritiesById
  //computed - длина избранного
  //проверка есть ли кок в избранном

}
