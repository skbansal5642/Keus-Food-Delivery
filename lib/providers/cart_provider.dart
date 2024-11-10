import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductListModel> cart = [];

  addProduct(ProductListModel product) {
    cart.add(product);
    notifyListeners();
  }

  double getTotal() {
    double total = 0.0;
    for (var product in cart) {
      double price = double.parse(product.price.replaceAll("\$", ""));
      total += price;
    }
    return total;
  }

  completeCheckout() {
    cart.clear();
    notifyListeners();
  }
}
