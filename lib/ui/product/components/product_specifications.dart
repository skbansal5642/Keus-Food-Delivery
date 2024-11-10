part of '../product_details_page.dart';

class ProductSpecifications extends StatelessWidget {
  ProductSpecifications({super.key});

  final Map<String, String> details = {
    '325': 'kcal',
    '420': 'grams',
    '21': 'proteins',
    '19': 'fats',
    '65': 'carbs',
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ...details.keys.map(
            (key) => Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      key,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      details[key]!,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
