import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keus_food_delivery/models/food_sliding_view_model.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';

class FoodSlidingView extends StatelessWidget {
  FoodSlidingView({
    super.key,
    required this.homeProvider,
  });

  final HomeProvider homeProvider;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return SizedBox(
      height: screenSize.width * 2 / 3,
      child: CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          height: screenSize.width,
          enableInfiniteScroll: false,
          initialPage: 0,
          viewportFraction: 1,
          onPageChanged: (index, reason) =>
              homeProvider.setActiveSliderIndex(index),
        ),
        items: [
          ...homeProvider.foodSlidingList.map(
            (ele) => _buildHitItem(
              foodSlidingViewModel: ele,
              size: screenSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHitItem({
    required FoodSlidingViewModel foodSlidingViewModel,
    required Size size,
  }) {
    return Stack(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ...foodSlidingViewModel.colors
                    .replaceAll("#", "")
                    .split(",")
                    .map((color) => Color(int.parse("0xFF$color"))),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      foodSlidingViewModel.title,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    width: size.width * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FittedBox(
                      child: Text(
                        foodSlidingViewModel.price,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            foodSlidingViewModel.image,
            fit: BoxFit.cover,
            height: (size.height / 6),
            width: (size.height / 6),
          ),
        ),
      ],
    );
  }
}
