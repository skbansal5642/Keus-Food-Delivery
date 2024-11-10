import 'package:flutter/material.dart';

class CategoryFilters extends StatelessWidget {
  CategoryFilters({super.key});

  final List<String> categories = ["Salads", "Pizza", "Beverages", "Snacks"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildFilterButton(child: const Icon(Icons.filter_list)),
            ...categories.map(
              (name) => _buildFilterButton(child: Text(name)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
