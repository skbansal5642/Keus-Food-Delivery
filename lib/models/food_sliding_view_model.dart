// To parse this JSON data, do
//
//     final foodSlidingViewModel = foodSlidingViewModelFromJson(jsonString);

import 'dart:convert';

List<FoodSlidingViewModel> foodSlidingViewModelFromJson(String str) =>
    List<FoodSlidingViewModel>.from(
        json.decode(str).map((x) => FoodSlidingViewModel.fromJson(x)));

class FoodSlidingViewModel {
  final String image;
  final String title;
  final String price;
  final String colors;

  FoodSlidingViewModel({
    required this.image,
    required this.title,
    required this.price,
    required this.colors,
  });

  factory FoodSlidingViewModel.fromJson(Map<String, dynamic> json) =>
      FoodSlidingViewModel(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        colors: json["colors"],
      );
}
