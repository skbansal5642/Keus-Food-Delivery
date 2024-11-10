import 'package:flutter/material.dart';

class CartBriefUi extends StatelessWidget {
  const CartBriefUi({
    super.key,
    required this.onPress,
    required this.cartTotal,
    required this.title,
  });

  final Function()? onPress;
  final String cartTotal;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPress,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF1f1f1f),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "24 min",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.036,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "•",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "\$$cartTotal",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
