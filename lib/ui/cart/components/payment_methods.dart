part of '../cart_page.dart';

class _PaymentMethods extends StatelessWidget {
  const _PaymentMethods();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment method",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: size.width * 0.035,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                "assets/images/apple-pay.png",
                width: size.width * 0.065,
              ),
            ),
            title: Text(
              "Apple pay",
              style: TextStyle(
                fontSize: size.width * 0.035,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: size.width * 0.035,
              color: Colors.black,
              fill: 1,
              grade: 10,
            ),
          ),
        ],
      ),
    );
  }
}
