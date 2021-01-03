// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$_CocktailImpl on CocktailStore, Store {
  Computed<int> _$countFavoritiesComputed;

  @override
  int get countFavorities =>
      (_$countFavoritiesComputed ??= Computed<int>(() => super.countFavorities,
              name: 'CocktailStore.countFavorities'))
          .value;

  final _$CocktailStoreActionController =
      ActionController(name: 'CocktailStore');

  @override
  void addItemToFavorities(CocktailDefinition cocktail) {
    final _$actionInfo = _$CocktailStoreActionController.startAction(
        name: 'CocktailStore.addItemToFavorities');
    try {
      return super.addItemToFavorities(cocktail);
    } finally {
      _$CocktailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItemFromFavorities(CocktailDefinition cocktail) {
    final _$actionInfo = _$CocktailStoreActionController.startAction(
        name: 'CocktailStore.removeItemFromFavorities');
    try {
      return super.removeItemFromFavorities(cocktail);
    } finally {
      _$CocktailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countFavorities: ${countFavorities}
    ''';
  }
}
