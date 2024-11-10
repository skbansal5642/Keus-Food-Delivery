part of '../cart_page.dart';

class _ShippingMethods extends StatelessWidget {
  const _ShippingMethods();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Free Delivery from \$30",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: size.width * 0.033,
                ),
              ),
            ],
          ),
          Text(
            "\$0.00",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.04,
            ),
          )
        ],
      ),
    );
  }
}
