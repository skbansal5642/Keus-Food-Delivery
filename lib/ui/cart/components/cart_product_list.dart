part of '../cart_page.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key, required this.cartProvider});

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        ...cartProvider.cart.map(
          (product) => CartProductBlock(product: product, size: screenSize),
        )
      ],
    );
  }
}
