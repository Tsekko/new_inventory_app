import 'package:flutter/material.dart';

@immutable
class Item {
  final String name;
  final int qty;
  final bool isEditing;

  const Item({
    required this.name,
    required this.qty,
    this.isEditing = false,
  });

  const Item.initial()
      : name = '',
        qty = 0,
        isEditing = false;

  Item copyWith({
    String? name,
    int? qty,
    bool? isEditing,
  }) {
    return Item(
      name: name ?? this.name,
      qty: qty ?? this.qty,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
