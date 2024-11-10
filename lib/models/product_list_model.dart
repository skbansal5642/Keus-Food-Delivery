// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  final String id;
  final String image;
  final String name;
  final String price;
  final String cal;

  ProductListModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.cal,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        cal: json["cal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "cal": cal,
      };
}
