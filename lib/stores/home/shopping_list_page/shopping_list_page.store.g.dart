// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'shopping_list_page.store.dart';

// // **************************************************************************
// // StoreGenerator
// // **************************************************************************

// // ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

// mixin _$ShoppingListPageStore on _ShoppingListPageStoreBase, Store {
//   late final _$currentListAtom =
//       Atom(name: '_ShoppingListPageStoreBase.currentList', context: context);

//   @override
//   ShoppingList get currentList {
//     _$currentListAtom.reportRead();
//     return super.currentList;
//   }

//   @override
//   set currentList(ShoppingList value) {
//     _$currentListAtom.reportWrite(value, super.currentList, () {
//       super.currentList = value;
//     });
//   }

//   late final _$_ShoppingListPageStoreBaseActionController =
//       ActionController(name: '_ShoppingListPageStoreBase', context: context);

//   @override
//   void removeItemFromList(Item itemToRemove) {
//     final _$actionInfo = _$_ShoppingListPageStoreBaseActionController
//         .startAction(name: '_ShoppingListPageStoreBase.removeItemFromList');
//     try {
//       return super.removeItemFromList(itemToRemove);
//     } finally {
//       _$_ShoppingListPageStoreBaseActionController.endAction(_$actionInfo);
//     }
//   }

//   @override
//   dynamic addNewItemToList(Item itemToAdd) {
//     final _$actionInfo = _$_ShoppingListPageStoreBaseActionController
//         .startAction(name: '_ShoppingListPageStoreBase.addNewItemToList');
//     try {
//       return super.addNewItemToList(itemToAdd);
//     } finally {
//       _$_ShoppingListPageStoreBaseActionController.endAction(_$actionInfo);
//     }
//   }

//   @override
//   String toString() {
//     return '''
// currentList: ${currentList}
//     ''';
//   }
// }
