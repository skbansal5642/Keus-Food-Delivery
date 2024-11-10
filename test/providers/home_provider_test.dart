import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  group('Test Home Page Functions', () {
    final homeProvider = HomeProvider();
    test("change sliding banner test", () {
      homeProvider.setActiveSliderIndex(3);
      expect(homeProvider.activeSliderIndex, 3);
    });

    test("get sliding banner data test", () async {
      expect(homeProvider.foodSlidingList.isNotEmpty, false);
      await homeProvider.getSlidingViewModel();
      expect(homeProvider.foodSlidingList.isNotEmpty, true);
    });

    test("get product list test", () async {
      expect(homeProvider.products.isNotEmpty, false);
      await homeProvider.getProductsList();
      expect(homeProvider.products.isNotEmpty, true);
    });
  });
}
