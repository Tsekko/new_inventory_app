import 'package:flutter/material.dart';

@immutable
class Item {
  final String name;
  final int qty;

  const Item({
    required this.name,
    required this.qty,
  });

  const Item.initial()
      : name = '',
        qty = 0;

  Item copyWith({
    String? name,
    int? qty,
  }) {
    return Item(
      name: name ?? this.name,
      qty: qty ?? this.qty,
    );
  }
}
