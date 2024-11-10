import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';
import 'package:keus_food_delivery/ui/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  late HomeProvider homeProvider;
  late CartProvider cartProvider;

  setUpAll(() {
    homeProvider = HomeProvider();
    cartProvider = CartProvider();
  });
  testWidgets("Test to Add & Remove Product From Cart", (tester) async {
    await tester.pumpWidget(_MainApp(
      homeProvider: homeProvider,
      cartProvider: cartProvider,
    ));

    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Find the first product
    final productFinder = find.text("Poke with chicken");
    expect(productFinder, findsOneWidget);

    // Tap on product and open product details
    await tester.tap(productFinder);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Find add to cart button
    final addToCartBtn = find.text("Add to cart");
    expect(addToCartBtn, findsOneWidget);

    // Add the product to cart
    await tester.tap(addToCartBtn);
    expect(cartProvider.cart.isEmpty, false);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Find the cart overlay on Home Screen
    final cartOverlay = find.text("Cart");
    expect(cartOverlay, findsOneWidget);

    // Open the cart details page
    await tester.tap(cartOverlay);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Find button to pay
    final payBtn = find.text("Pay");
    expect(payBtn, findsOneWidget);

    // Open the cart details page
    await tester.tap(payBtn);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Ensure the cart is cleared
    expect(cartProvider.cart.isEmpty, true);
  });
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    required this.cartProvider,
    required this.homeProvider,
  });

  final HomeProvider homeProvider;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Keus Food Delivery',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => homeProvider..initialize()),
          ChangeNotifierProvider<CartProvider>(
              create: (context) => cartProvider),
        ],
        child: Consumer2<HomeProvider, CartProvider>(
          builder: (context, homeProvider, cartProvider, child) => HomePage(
            homeProvider: homeProvider,
            cartProvider: cartProvider,
          ),
        ),
      ),
    );
  }
}
