import 'package:flutter/material.dart';
import 'package:new_inventory_app/features/products/product.dart';

const productMock = [
  Product(name: "Albums"),
];

@immutable
class ProductState {
  final List<Product> lstProducts;

  const ProductState({required this.lstProducts});

  ProductState copyWith({
    List<Product>? lstProducts,
  }) {
    return ProductState(lstProducts: lstProducts ?? this.lstProducts);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductState && other.lstProducts == lstProducts;
  }

  @override
  int get hashCode {
    return lstProducts.hashCode;
  }
}
