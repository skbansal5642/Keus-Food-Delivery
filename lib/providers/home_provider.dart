import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keus_food_delivery/models/food_sliding_view_model.dart';
import 'package:keus_food_delivery/models/product_list_model.dart';

class HomeProvider extends ChangeNotifier {
  int activeSliderIndex = 0;
  List<FoodSlidingViewModel> foodSlidingList = [];
  List<ProductListModel> products = [];

  void initialize() {
    getSlidingViewModel();
    getProductsList();
  }

  setActiveSliderIndex(index) {
    activeSliderIndex = index;
    notifyListeners();
  }

  getSlidingViewModel() async {
    String jsonFilePath = "assets/resources/sliding_view_data.json";
    String jsonString = await rootBundle.loadString(jsonFilePath);

    foodSlidingList = foodSlidingViewModelFromJson(jsonString);
    notifyListeners();
  }

  getProductsList() async {
    String jsonFilePath = "assets/resources/product_list.json";
    String jsonString = await rootBundle.loadString(jsonFilePath);

    products = productListModelFromJson(jsonString);
    notifyListeners();
  }
}
