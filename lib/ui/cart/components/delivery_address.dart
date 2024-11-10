part of '../cart_page.dart';

class _DeliveryAddress extends StatelessWidget {
  const _DeliveryAddress();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "100a Ealing Rd",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.034,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            "Change address",
            style: TextStyle(color: Colors.grey.shade400),
          )
        ],
      ),
    );
  }
}
