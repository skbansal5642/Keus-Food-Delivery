// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';
import 'package:keus_food_delivery/ui/cart/cart_page.dart';
import 'package:keus_food_delivery/ui/home/components/cart_overlay.dart';
import 'package:keus_food_delivery/ui/home/components/product_block.dart';
import 'package:keus_food_delivery/ui/product/product_details_page.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.homeProvider,
    required this.cartProvider,
  });

  final HomeProvider homeProvider;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          ...homeProvider.products.map(
            (product) => ProductBlock(
              product: product,
              size: screenSize,
              onPress: () => openProductDetails(context, product),
            ),
          ),
        ],
      ),
    );
  }

  openProductDetails(BuildContext context, ProductListModel product) async {
    try {
      CartOverlay.remove();
    } catch (_) {}

    await showModalBottomSheet(
      context: context,
      builder: (context) => ProductDetailsPage(
        product: product,
        cartProvider: cartProvider,
      ),
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      elevation: 10,
      backgroundColor: Colors.transparent,
    );
    if (cartProvider.cart.isNotEmpty) {
      CartOverlay.show(
        context,
        cartTotal: cartProvider.getTotal().toString(),
        onTap: () => openCartDetails(context),
      );
    }
  }

  openCartDetails(BuildContext context) async {
    try {
      CartOverlay.remove();
    } catch (_) {}
    await showModalBottomSheet(
      context: context,
      builder: (context) => CartPage(cartProvider: cartProvider),
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      elevation: 10,
      backgroundColor: Colors.transparent,
    );
    if (cartProvider.cart.isNotEmpty) {
      CartOverlay.show(
        context,
        cartTotal: cartProvider.getTotal().toString(),
        onTap: () => openCartDetails(context),
      );
    }
  }
}
