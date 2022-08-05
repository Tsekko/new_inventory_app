import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/products/product.dart';

class ProductFormPage extends ConsumerWidget {
  static const routeName = "/productFormPage";
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    Product newProduct = const Product.initial();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom du produit :',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field need to be completed';
                }
                return null;
              },
              onSaved: (value) {
                newProduct = newProduct.copyWith(name: value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  Navigator.of(context).pop(newProduct);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
