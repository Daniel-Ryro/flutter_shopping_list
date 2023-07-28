import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shopping_list/app_common_data.dart';
import 'package:flutter_shopping_list/models/shoppingListModel.dart';
import 'package:flutter_shopping_list/routesconstants.dart';
import 'package:flutter_shopping_list/stores/home/home.store.dart';
import 'package:flutter_shopping_list/utils.dart';

class ShoppingListCard extends StatelessWidget {
  ShoppingListCard({
    Key? key,
    required this.currentList,
    required this.homeStore,
  }) : super(key: key);

  final ShoppingList currentList;
  final HomeStore homeStore;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(currentList.name),
      subtitle: Observer(
        builder: (_) => Text('Items count: ${currentList.items.length}'),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (_) =>
                Text('Total: ${formatPrice(calculateTotalValue())}'),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              _showDeleteConfirmationDialog(context);
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      onTap: () {
        AppCommonData.getInstance().currentList = currentList;
        Navigator.of(context).pushNamed(SHOPPINGLISTPAGE, arguments: homeStore);
      },
    );
  }

  double calculateTotalValue() {
    double total = 0;

    for (var i = 0; i < currentList.items.length; i++) {
      Item item = currentList.items[i];
      total += item.unitValue * item.quantity;
    }

    return total;
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Shopping List'),
          content: const Text('Are you sure you want to delete this shopping list?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o dialog sem excluir
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Remove a lista de compras e fecha o dialog
                homeStore.RemoveShoppingList(currentList);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
