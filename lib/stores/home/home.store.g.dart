// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$shoppingListsAtom =
      Atom(name: '_HomeStoreBase.shoppingLists', context: context);

  @override
  ShoppingLists get shoppingLists {
    _$shoppingListsAtom.reportRead();
    return super.shoppingLists;
  }

  @override
  set shoppingLists(ShoppingLists value) {
    _$shoppingListsAtom.reportWrite(value, super.shoppingLists, () {
      super.shoppingLists = value;
    });
  }

  late final _$LoadShoppingListsAsyncAction =
      AsyncAction('_HomeStoreBase.LoadShoppingLists', context: context);

  @override
  Future<void> LoadShoppingLists() {
    return _$LoadShoppingListsAsyncAction.run(() => super.LoadShoppingLists());
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void AddShoppingList(ShoppingList list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.AddShoppingList');
    try {
      return super.AddShoppingList(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void RemoveShoppingList(ShoppingList list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.RemoveShoppingList');
    try {
      return super.RemoveShoppingList(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shoppingLists: ${shoppingLists}
    ''';
  }
}
