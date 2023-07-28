import 'package:flutter_shopping_list/models/shopping_list_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ShoppingLists shoppingLists = ShoppingLists(lists: []);

  @action
  void AddShoppingList(ShoppingList list) {
    shoppingLists.lists.add(list);
  }

  @action
  void RemoveShoppingList(ShoppingList list) {
    shoppingLists.lists.remove(list);
    SaveShoppingLists();
  }

   @action
  void RemoveItem(ShoppingList list, Item item) {
    for (int i = 0; i < shoppingLists.lists.length; i++) {
      if (shoppingLists.lists[i].name == list.name) {
        shoppingLists.lists[i].items.remove(item);
        SaveShoppingLists();
        break;
      }
    }
  }
@action
  void UpdateShoppingList(ShoppingList list) {
    // Encontra a lista de compras correspondente e atualiza seus itens
    for (int i = 0; i < shoppingLists.lists.length; i++) {
      if (shoppingLists.lists[i].name == list.name) {
        shoppingLists.lists[i] = list;
        SaveShoppingLists();
        break;
      }
    }
  }
  Future<void> SaveShoppingLists() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('shoppingLists', shoppingLists.toJson());
  }

  @action
  Future<void> LoadShoppingLists() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('shoppingLists')) {
      String? json = await prefs.getString('shoppingLists');
      if (json != "") {
        shoppingLists = ShoppingLists.fromJson(json as String);
        
      }
    }
  }
}
