import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/items/item.dart';
import 'package:new_inventory_app/features/items/item_form_page.dart';
import 'package:new_inventory_app/features/products/product.dart';
import 'package:new_inventory_app/features/products/product_card.dart';
import 'package:new_inventory_app/features/products/product_controller.dart';

class ProductInventory extends ConsumerWidget {
  const ProductInventory({Key? key, required this.indexProduct})
      : super(key: key);
  static const routeName = '/product_inventory';
  final int indexProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Product _product =
        ref.watch(productControllerProvider).lstProducts[indexProduct];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            _product.name,
            style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _product.lstItems.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    index: index,
                    indexProduct: indexProduct,
                    onItemQuantityUpdated: (int newQty) => ref
                        .read(productControllerProvider.notifier)
                        .updateQty(newQty, indexProduct, index),
                    onItemTitleUpdated: (String title) => ref
                        .read(productControllerProvider.notifier)
                        .updateName(title, indexProduct, index),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Item? item = await Navigator.of(context)
              .pushNamed<Item?>(ItemFormPage.routeName);
          if (item != null) {
            ref
                .read(productControllerProvider.notifier)
                .addItem(item, indexProduct);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
