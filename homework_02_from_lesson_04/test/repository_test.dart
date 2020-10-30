@TestOn('vm')
import 'package:cocktaildbhttpusing/src/model/cocktail_type.dart';
import 'package:cocktaildbhttpusing/src/repository/async_cocktail_repository.dart';
import 'package:cocktaildbhttpusing/src/repository/sync_cocktail_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  SyncCocktailRepository syncRepository;
  AsyncCocktailRepository asyncRepository;

  setUp(() {
    syncRepository = SyncCocktailRepository();
    asyncRepository = AsyncCocktailRepository();
  });

  group('Coctail repository', () {
    test('fetchAllCocktails method should return all cocktails', () {
      final actualResult = syncRepository.fetchAllCocktails();
      expect(actualResult, isNotEmpty);
    });

    test('fetchPopularCocktails method should return 20 popular cocktails', () {
      final actualResult = syncRepository.fetchPopularCocktails();
      expect(actualResult, isNotEmpty);
      expect(actualResult.length, 20);
    });

    test('fetchPopularCocktails method should return all popular cocktails using real api', () async {
      final actualResult = await asyncRepository.fetchPopularCocktails();
      expect(actualResult, isNotEmpty);
    });

    test(
        'fetchCocktailsByCocktailType method should return all available cocktail definitions using real api and coctail type filter',
        () async {
      final actualResult = await asyncRepository.fetchCocktailsByCocktailType(CocktailType.alcoholic);
      expect(actualResult, isNotEmpty);
    });

    test('fetchCocktailDetails method should return all full cocktail details using real api and coctail id', () async {
      final actualResult = await asyncRepository.fetchCocktailDetails('15300');
      expect(actualResult, isNotNull);
    });

    test(
        'getRandomCocktail method should return all available cocktail definition using real api and coctail type filter',
        () async {
      final actualResult = await asyncRepository.getRandomCocktail();
      expect(actualResult, isNotNull);
    });
  });
}
