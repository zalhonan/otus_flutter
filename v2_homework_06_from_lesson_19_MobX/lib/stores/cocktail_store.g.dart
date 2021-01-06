// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_CocktailImpl on CocktailStore, Store {
  Computed<List<String>> _$favoritiesIdsComputed;

  @override
  List<String> get favoritiesIds => (_$favoritiesIdsComputed ??=
          Computed<List<String>>(() => super.favoritiesIds,
              name: 'CocktailStore.favoritiesIds'))
      .value;
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: 'CocktailStore.hasResults'))
          .value;

  final _$currentCocktailsAtom = Atom(name: 'CocktailStore.currentCocktails');

  @override
  List<CocktailDefinition> get currentCocktails {
    _$currentCocktailsAtom.reportRead();
    return super.currentCocktails;
  }

  @override
  set currentCocktails(List<CocktailDefinition> value) {
    _$currentCocktailsAtom.reportWrite(value, super.currentCocktails, () {
      super.currentCocktails = value;
    });
  }

  final _$favoritiesAtom = Atom(name: 'CocktailStore.favorities');

  @override
  List<CocktailDefinition> get favorities {
    _$favoritiesAtom.reportRead();
    return super.favorities;
  }

  @override
  set favorities(List<CocktailDefinition> value) {
    _$favoritiesAtom.reportWrite(value, super.favorities, () {
      super.favorities = value;
    });
  }

  final _$currentCategoryAtom = Atom(name: 'CocktailStore.currentCategory');

  @override
  CocktailCategory get currentCategory {
    _$currentCategoryAtom.reportRead();
    return super.currentCategory;
  }

  @override
  set currentCategory(CocktailCategory value) {
    _$currentCategoryAtom.reportWrite(value, super.currentCategory, () {
      super.currentCategory = value;
    });
  }

  final _$fetchCocktailsFutureAtom =
      Atom(name: 'CocktailStore.fetchCocktailsFuture');

  @override
  ObservableFuture<List<CocktailDefinition>> get fetchCocktailsFuture {
    _$fetchCocktailsFutureAtom.reportRead();
    return super.fetchCocktailsFuture;
  }

  @override
  set fetchCocktailsFuture(ObservableFuture<List<CocktailDefinition>> value) {
    _$fetchCocktailsFutureAtom.reportWrite(value, super.fetchCocktailsFuture,
        () {
      super.fetchCocktailsFuture = value;
    });
  }

  final _$CocktailStoreActionController =
      ActionController(name: 'CocktailStore');

  @override
  void setCategory(CocktailCategory newCategory) {
    final _$actionInfo = _$CocktailStoreActionController.startAction(
        name: 'CocktailStore.setCategory');
    try {
      return super.setCategory(newCategory);
    } finally {
      _$CocktailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCocktails: ${currentCocktails},
favorities: ${favorities},
currentCategory: ${currentCategory},
fetchCocktailsFuture: ${fetchCocktailsFuture},
favoritiesIds: ${favoritiesIds},
hasResults: ${hasResults}
    ''';
  }
}
