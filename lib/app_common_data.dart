import 'package:flutter_shopping_list/models/shopping_list_model.dart';
import 'package:flutter_shopping_list/stores/home/shopping_list_page/shopping_list_page.store.dart';

class AppCommonData{
  static AppCommonData? instance;

  static AppCommonData getInstance(){
    instance ??= AppCommonData();
    return instance!;
  }

  late ShoppingList currentList;
}