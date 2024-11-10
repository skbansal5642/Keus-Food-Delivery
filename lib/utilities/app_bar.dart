import 'package:flutter/material.dart';

PreferredSizeWidget? customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: const Icon(Icons.menu),
    centerTitle: true,
    title: Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: const FittedBox(
        child: Text(
          '100a Ealing Rd. • 24 mins',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Icon(Icons.search),
      ),
    ],
  );
}
