import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/products/product.dart';
import 'package:new_inventory_app/features/products/product_controller.dart';
import 'package:new_inventory_app/features/products/product_form_page.dart';
import 'package:new_inventory_app/features/products/product_inventory.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stock',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: ref.watch(productControllerProvider).lstProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(index.toString()),
              title: Text(
                  ref.watch(productControllerProvider).lstProducts[index].name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, ProductInventory.routeName,
                    arguments: index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Product? product = await Navigator.of(context)
                .pushNamed<Product?>(ProductFormPage.routeName);
            if (product != null) {
              ref.read(productControllerProvider.notifier).addProduct(product);
            }
          }),
    );
  }
}
