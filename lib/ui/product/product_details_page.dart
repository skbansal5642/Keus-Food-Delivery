import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/ui/product/components/add_to_cart_button.dart';
import 'package:keus_food_delivery/ui/product/components/product_stepper.dart';

part 'components/product_specifications.dart';
part 'components/product_title.dart';
part 'components/product_description.dart';
part 'components/add_poke.dart';
part 'components/product_actions.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.cartProvider,
  });

  final ProductListModel product;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          ProductDetails(
            screenSize: screenSize,
            product: product,
            cartProvider: cartProvider,
          ),
        ],
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.screenSize,
    required this.product,
    required this.cartProvider,
  });

  final Size screenSize;
  final ProductListModel product;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: screenSize.width,
      height: MediaQuery.of(context).copyWith().size.height * 0.95 - 15,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Image.asset(
                    product.image,
                    height: screenSize.width * 3 / 4,
                    fit: BoxFit.contain,
                  ),
                ),
                _ProductTitle(product: product),
                const _ProductDescription(),
                ProductSpecifications(),
                const AddPoke(),
                _ProductActions(
                  cartProvider: cartProvider,
                  product: product,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
