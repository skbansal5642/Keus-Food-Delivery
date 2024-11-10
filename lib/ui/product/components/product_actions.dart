part of '../product_details_page.dart';

class _ProductActions extends StatelessWidget {
  const _ProductActions({
    required this.cartProvider,
    required this.product,
  });

  final CartProvider cartProvider;
  final ProductListModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: ProductStepper(),
        ),
        Expanded(
          flex: 3,
          child: AddToCartButton(
            cartProvider: cartProvider,
            onPress: () => addProductToCart(context),
          ),
        ),
      ],
    );
  }

  addProductToCart(BuildContext context) {
    cartProvider.addProduct(product);
    Navigator.pop(context);
  }
}
