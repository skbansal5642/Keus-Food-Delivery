import 'package:flutter/material.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';
import 'package:keus_food_delivery/ui/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              create: (context) => HomeProvider()..initialize()),
          ChangeNotifierProvider<CartProvider>(
              create: (context) => CartProvider()),
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
