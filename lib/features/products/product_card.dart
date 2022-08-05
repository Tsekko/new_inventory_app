import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/items/item.dart';
import 'package:new_inventory_app/features/products/product_controller.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    Key? key,
    required this.onItemQuantityUpdated,
    required this.onItemTitleUpdated,
    required this.onEditUpdated,
    required this.index,
    required this.indexProduct,
  }) : super(key: key);

  final int index;
  final int indexProduct;
  final Function(int) onItemQuantityUpdated;
  final Function(String) onItemTitleUpdated;
  final Function(bool) onEditUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Item item = ref
        .watch(productControllerProvider)
        .lstProducts[indexProduct]
        .lstItems[index];
    TextEditingController? _controller;

    return Card(
      child: Column(children: [
        Expanded(
          child: !item.isEditing
              ? Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 32.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )
              : TextField(
                  controller: _controller =
                      TextEditingController(text: item.name),
                  onSubmitted: (String value) {
                    onItemTitleUpdated(value);
                  },
                ),
        ),
        Expanded(
          child: Text(
            "Quantité : " + item.qty.toString(),
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  if (item.qty > 0) {
                    onItemQuantityUpdated(item.qty - 1);
                  }
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  onItemQuantityUpdated(item.qty + 1);
                },
              ),
            ),
            Expanded(
                child: ElevatedButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                onEditUpdated(!item.isEditing);
              },
            ))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ]),
    );
  }
}
