part of '../product_details_page.dart';

class _ProductDescription extends StatelessWidget {
  const _ProductDescription();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Famous Hawaiian dish. Rice pillow with tender chicken breast, mushrooms, lettuce, cherry tomatoes, seaweed and corn, with unagi sauce.",
        style: TextStyle(
          fontSize: size.width * 0.035,
          color: Colors.black54,
        ),
      ),
    );
  }
}
