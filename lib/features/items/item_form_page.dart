import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/items/item.dart';

class ItemFormPage extends ConsumerWidget {
  static const routeName = '/item_form_page';
  const ItemFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    Item newItem = const Item.initial();

    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nom du produit : ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field needs to be completed";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newItem = newItem.copyWith(name: value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Quantité : ",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field needs to be completed";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newItem = newItem.copyWith(qty: int.parse(value!));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      Navigator.of(context).pop(newItem);
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            )));
  }
}
