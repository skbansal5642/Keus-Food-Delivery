import 'package:flutter/material.dart';

class CommonStepper extends StatelessWidget {
  const CommonStepper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.remove,
            color: Colors.grey.shade600,
            size: size.width * 0.04,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '1',
            style: TextStyle(
              fontSize: size.width * 0.045,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.add,
            color: Colors.grey.shade600,
            size: size.width * 0.045,
          ),
        ),
      ],
    );
  }
}
