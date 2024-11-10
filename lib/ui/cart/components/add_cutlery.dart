part of '../cart_page.dart';

class _AddCutlery extends StatelessWidget {
  const _AddCutlery();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/cutlery.png",
            width: screenSize.width * 0.045,
            height: screenSize.width * 0.045,
          ),
          Text(
            "Cutlery",
            style: TextStyle(
              fontSize: screenSize.width * 0.036,
            ),
          ),
          CommonStepper(size: screenSize),
        ],
      ),
    );
  }
}
