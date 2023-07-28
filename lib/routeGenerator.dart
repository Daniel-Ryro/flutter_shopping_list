import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/pages/add_new_shopping_list.dart';
import 'package:flutter_shopping_list/pages/add_new_shopping_list_item.dart';
import 'package:flutter_shopping_list/pages/home.dart';
import 'package:flutter_shopping_list/pages/notFound.dart';
import 'package:flutter_shopping_list/pages/shopping_list_page.dart';
import 'package:flutter_shopping_list/routesconstants.dart';
import 'package:flutter_shopping_list/stores/home/home.store.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case ADDNEWSHOPPINGLIST:
        return MaterialPageRoute(
            builder: (_) => AddNewShoppingList(
                  homeStore: settings.arguments as HomeStore,
                ));
      case SHOPPINGLISTPAGE:
        return MaterialPageRoute(
            builder: (_) => ShoppingListPage(
                  homeStore: settings.arguments as HomeStore,
                ));
      case ADDNEWSHOPPINGLISTITEM:
        return MaterialPageRoute(
            builder: (_) => AddNewShoppingListItem(
                  homeStore: settings.arguments as HomeStore,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const NotFound());
    }
  }
}
