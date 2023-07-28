import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/app_common_data.dart';
import 'package:flutter_shopping_list/components/shopping_list_item_card.dart';
import 'package:flutter_shopping_list/models/shopping_list_model.dart';
import 'package:flutter_shopping_list/routes_constants.dart';
import 'package:flutter_shopping_list/stores/home/home_store.dart';

// ignore: must_be_immutable
class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({super.key, required this.homeStore});
  HomeStore homeStore;

  ShoppingList currentList = AppCommonData.getInstance().currentList;

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  Future<void> _refreshList() async {
    await widget.homeStore.LoadShoppingLists(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
        }),
        title: Text(widget.currentList.name),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ADDNEWSHOPPINGLISTITEM,
                    arguments: widget.homeStore);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshList, // Specify the refresh function here
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ShoppingListItemCard(
              currentItem: widget.currentList.items[index],
              homeStore: widget.homeStore,
              currentList: widget.currentList,
            );
          },
          itemCount: widget.currentList.items.length,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
