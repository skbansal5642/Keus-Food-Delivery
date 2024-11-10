import 'package:flutter/material.dart';
import 'package:keus_food_delivery/providers/home_provider.dart';

class SlidingIndicator extends StatelessWidget {
  const SlidingIndicator({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(4, (index) {
            return Expanded(
              child: Container(
                height: 3,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: homeProvider.activeSliderIndex == index
                      ? Colors.black
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
