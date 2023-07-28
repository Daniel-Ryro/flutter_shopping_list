import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/app_common_data.dart';
import 'package:flutter_shopping_list/apptheme.dart';
import 'package:flutter_shopping_list/models/shopping_list_model.dart';
import 'package:flutter_shopping_list/stores/home/home_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class AddNewShoppingListItem extends StatefulWidget {
  AddNewShoppingListItem({Key? key, required this.homeStore}) : super(key: key);
  HomeStore homeStore;

  @override
  State<AddNewShoppingListItem> createState() => _AddNewShoppingListItemState();
}

class _AddNewShoppingListItemState extends State<AddNewShoppingListItem> {
  final form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'unitValue': FormControl<double>(validators: [Validators.required]),
    'quantity': FormControl<int>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Item"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ReactiveForm(
            formGroup: form,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: smallspacing,
                vertical: smallspacing,
              ),
              child: Column(
                children: [
                  ReactiveTextField(
                    formControlName: 'name',
                    decoration: InputDecoration(
                      labelText: "List Item Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: littlespacing),
                  ReactiveTextField(
                    formControlName: 'unitValue',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Unit Value",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: littlespacing),
                  ReactiveTextField(
                    formControlName: 'quantity',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: littlespacing),
                  ElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (form.valid) {
                        Item newItem = Item(
                          name: form.control('name').value,
                          unitValue: double.parse(
                            form.control('unitValue').value.toString(),
                          ),
                          quantity: int.parse(
                            form.control('quantity').value.toString(),
                          ),
                        );

                        AppCommonData.getInstance()
                            .currentList
                            .items
                            .add(newItem);

                        widget.homeStore.UpdateShoppingList(
                          AppCommonData.getInstance().currentList,
                        );

                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Create"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showImagePickerDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Add Image"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    _captureImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Capture from Camera'),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    _captureImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Select from Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _captureImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
    }
  }
}
