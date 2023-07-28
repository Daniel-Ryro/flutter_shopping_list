import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/apptheme.dart';
import 'package:flutter_shopping_list/models/shoppingListModel.dart';
import 'package:flutter_shopping_list/stores/home/home.store.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class AddNewShoppingList extends StatefulWidget {
  AddNewShoppingList({super.key, required this.homeStore});

  HomeStore homeStore;

  @override
  State<AddNewShoppingList> createState() => _AddNewShoppingListState();
}

class _AddNewShoppingListState extends State<AddNewShoppingList> {
  final form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    )
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Shopping List"),
        centerTitle: true,
      ),
      body: Column(children: [
        ReactiveForm(
            formGroup: form,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: smallspacing, vertical: smallspacing),
              child: Column(
                children: [
                  ReactiveTextField(
                    formControlName: 'name',
                    decoration: InputDecoration(
                        labelText: "Shopping List Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: littlespacing,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (form.valid) {
                        widget.homeStore.AddShoppingList(ShoppingList(
                            name: form.control('name').value, items: []));
                        widget.homeStore.SaveShoppingLists();
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Create"),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
