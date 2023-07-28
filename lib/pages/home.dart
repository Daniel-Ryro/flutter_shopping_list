import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shopping_list/components/shopping_list_card.dart';
import 'package:flutter_shopping_list/models/shoppingListModel.dart';
import 'package:flutter_shopping_list/routesconstants.dart';
import 'package:flutter_shopping_list/stores/home/home.store.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.LoadShoppingLists();
  }

  void _removeShoppingList(ShoppingList list) {
    store.RemoveShoppingList(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Lists"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(ADDNEWSHOPPINGLIST, arguments: store);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.shoppingLists.lists.isEmpty) {
            return const Center(
              child: Text("No shopping lists found."),
            );
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
              onRefresh: () async {
                await store.LoadShoppingLists();
              },
              child: Observer(
                builder: (_) => ListView.builder(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(store.shoppingLists.lists[index].name),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        _removeShoppingList(store.shoppingLists.lists[index]);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      child: ShoppingListCard(
                        currentList: store.shoppingLists.lists[index],
                        homeStore: store,
                      ),
                    );
                  },
                  itemCount: store.shoppingLists.lists.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
