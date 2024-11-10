import 'package:flutter/material.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/ui/cart/components/cart_brief_ui.dart';
import 'package:keus_food_delivery/ui/cart/components/cart_product_block.dart';
import 'package:keus_food_delivery/utilities/common_stepper.dart';

part 'components/page_title.dart';
part 'components/delivery_address.dart';
part 'components/cart_product_list.dart';
part 'components/add_cutlery.dart';
part 'components/shipping_methods.dart';
part 'components/payment_methods.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.cartProvider,
  });

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95 + 10,
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
          CartDetails(
            screenSize: screenSize,
            cartProvider: cartProvider,
          ),
        ],
      ),
    );
  }
}

class CartDetails extends StatelessWidget {
  const CartDetails({
    super.key,
    required this.screenSize,
    required this.cartProvider,
  });

  final Size screenSize;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      width: screenSize.width,
      height: size.height * 0.95 - 10,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.95 * 0.70,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const _PageTitle(),
                      const _DeliveryAddress(),
                      CartProductList(cartProvider: cartProvider),
                      Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                      const _AddCutlery(),
                      Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey.shade200,
                      ),
                      const _ShippingMethods(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.95 * 0.2 + 20,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const _PaymentMethods(),
                      CartBriefUi(
                        onPress: () => initiatePayment(context),
                        cartTotal: cartProvider.getTotal().toString(),
                        title: "Pay",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  initiatePayment(BuildContext context) {
    cartProvider.completeCheckout();
    Navigator.pop(context);
  }
}
