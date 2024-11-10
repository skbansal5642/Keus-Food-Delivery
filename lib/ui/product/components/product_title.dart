part of '../product_details_page.dart';

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({required this.product});

  final ProductListModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.045,
          ),
        ),
      ),
    );
  }
}
