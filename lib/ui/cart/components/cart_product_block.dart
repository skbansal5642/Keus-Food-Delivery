import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';
import 'package:keus_food_delivery/utilities/common_stepper.dart';

class CartProductBlock extends StatelessWidget {
  const CartProductBlock({
    super.key,
    required this.product,
    required this.size,
    this.onPress,
  });

  final ProductListModel product;
  final Size size;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            product.name,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          product.price,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: size.width * 0.040,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  CommonStepper(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
