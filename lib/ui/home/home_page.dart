import 'package:flutter/material.dart';
import 'package:keus_food_delivery/providers/cart_provider.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';
import 'package:keus_food_delivery/ui/home/components/category_filter.dart';
import 'package:keus_food_delivery/ui/home/components/food_sliding_view.dart';
import 'package:keus_food_delivery/ui/home/components/product_list_view.dart';
import 'package:keus_food_delivery/ui/home/components/sliding_indicator.dart';
import 'package:keus_food_delivery/utilities/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.homeProvider,
    required this.cartProvider,
  });

  final HomeProvider homeProvider;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: customAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Hits of the week',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FoodSlidingView(homeProvider: homeProvider),
                SlidingIndicator(homeProvider: homeProvider),
                CategoryFilters(),
                ProductListView(
                  homeProvider: homeProvider,
                  cartProvider: cartProvider,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
