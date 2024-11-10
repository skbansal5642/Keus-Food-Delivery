import 'package:flutter/material.dart';

class ProductStepper extends StatelessWidget {
  const ProductStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.remove,
            color: Colors.grey.shade500,
            size: size.width * 0.045,
          ),
          Text(
            "1",
            style: TextStyle(
              color: Colors.black,
              fontSize:  size.width * 0.04,
            ),
          ),
          Icon(
            Icons.add,
            color: Colors.grey.shade700,
            size: size.width * 0.045,
          ),
        ],
      ),
    );
  }
}
