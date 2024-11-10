part of '../product_details_page.dart';

class AddPoke extends StatelessWidget {
  const AddPoke({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Add in Poke",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.042,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
