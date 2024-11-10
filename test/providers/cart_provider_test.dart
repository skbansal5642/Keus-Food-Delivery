import 'package:flutter_test/flutter_test.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';

void main() {
  group('Test Cart Functions', () {
    final cartProvider = CartProvider();
    test("Add Product to Cart", () {
      ProductListModel product = ProductListModel(
          id: '1', image: "", name: "", price: "\$0.0", cal: "");
      cartProvider.addProduct(product);
      expect(cartProvider.cart.length, 1);
    });

    test("Get Total Cost of Cart", () {
      ProductListModel product1 = ProductListModel(
          id: '1', image: "", name: "", price: "\$20.0", cal: "");
      ProductListModel product2 = ProductListModel(
          id: '2', image: "", name: "", price: "\$10.0", cal: "");
      cartProvider.addProduct(product1);
      cartProvider.addProduct(product2);
      double total = cartProvider.getTotal();
      expect(total, 30);
    });

    test("Clear Cart", () {
      ProductListModel product1 = ProductListModel(
          id: '1', image: "", name: "", price: "\$20", cal: "");
      ProductListModel product2 = ProductListModel(
          id: '2', image: "", name: "", price: "\$10", cal: "");
      cartProvider.addProduct(product1);
      cartProvider.addProduct(product2);
      expect(cartProvider.cart.isNotEmpty, true);
      cartProvider.completeCheckout();
      expect(cartProvider.cart.isEmpty, true);
    });
  });
}
