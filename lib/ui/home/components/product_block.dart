import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';

class ProductBlock extends StatelessWidget {
  const ProductBlock({
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product.price,
                          style: TextStyle(
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        product.cal,
                        style: TextStyle(
                          fontSize: size.width * 0.033,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
