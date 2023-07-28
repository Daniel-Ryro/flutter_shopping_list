import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/models/shopping_list_model.dart';
import 'package:flutter_shopping_list/stores/home/home_store.dart';

class ShoppingListItemCard extends StatefulWidget {
  ShoppingListItemCard({
    Key? key,
    required this.currentItem,
    required this.homeStore,
    required this.currentList,
  }) : super(key: key);

  final HomeStore homeStore;
  final Item currentItem;
  final ShoppingList currentList;

  @override
  State<ShoppingListItemCard> createState() => _ShoppingListItemCardState();
}

class _ShoppingListItemCardState extends State<ShoppingListItemCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.currentItem.name),
      subtitle: Text(
          'Price: \$${widget.currentItem.unitValue.toStringAsFixed(2)}, Quantity: ${widget.currentItem.quantity.toString()}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.currentItem.quantity += 1;
                widget.homeStore.SaveShoppingLists();
                widget.homeStore.LoadShoppingLists();
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (widget.currentItem.quantity > 1) {
                  widget.currentItem.quantity -= 1;
                  widget.homeStore.SaveShoppingLists();
                  widget.homeStore.LoadShoppingLists();
                }
              });
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without deleting
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                widget.homeStore
                    .RemoveItem(widget.currentList, widget.currentItem);
                widget.homeStore.SaveShoppingLists();
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
