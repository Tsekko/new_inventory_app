import 'package:flutter/material.dart';
import 'package:new_inventory_app/features/items/item.dart';

@immutable
class Product {
  final String name;
  final List<Item> lstItems;

  const Product({required this.name, this.lstItems = const []});

  const Product.initial()
      : name = '',
        lstItems = const [];

  Product copyWith({
    String? name,
    List<Item>? lstItems,
  }) {
    return Product(
        name: name ?? this.name, lstItems: lstItems ?? this.lstItems);
  }
}
