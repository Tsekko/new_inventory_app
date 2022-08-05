import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_inventory_app/features/items/item.dart';
import 'package:new_inventory_app/features/products/product.dart';
import 'package:new_inventory_app/features/products/product_state.dart';

final productControllerProvider =
    StateNotifierProvider<ProductController, ProductState>((ref) {
  return ProductController(
    const ProductState(lstProducts: []),
  );
});

class ProductController extends StateNotifier<ProductState> {
  ProductController(ProductState state) : super(state);

  void updateQty(int newQty, int indexProduct, int index) {
    List<Item> listItems = state.lstProducts[indexProduct].lstItems;
    listItems[index] = listItems[index].copyWith(qty: newQty);
    List<Product> lstProducts = state.lstProducts;
    lstProducts[index] =
        lstProducts[indexProduct].copyWith(lstItems: listItems);
    state = state.copyWith(lstProducts: lstProducts);
  }

  void updateName(String name, int indexProduct, int index) {
    List<Item> listItems = state.lstProducts[indexProduct].lstItems;
    listItems[index] = listItems[index].copyWith(name: name);
    List<Product> lstProducts = state.lstProducts;
    lstProducts[index] =
        lstProducts[indexProduct].copyWith(lstItems: listItems);
    state = state.copyWith(lstProducts: lstProducts);
  }

  void addProduct(Product toAdd) {
    state = state.copyWith(lstProducts: [
      for (final product in state.lstProducts) product,
      toAdd,
    ]);
  }

  void addItem(Item toAdd, int indexProduct) {
    state.lstProducts[indexProduct] =
        state.lstProducts[indexProduct].copyWith(lstItems: [
      for (final item in state.lstProducts[indexProduct].lstItems) item,
      toAdd,
    ]);
  }

  void updateEdit(bool isEditing, int indexProduct, int index) {
    state.lstProducts[indexProduct].lstItems[index] = state
        .lstProducts[indexProduct].lstItems[index]
        .copyWith(isEditing: isEditing);
  }
}
