import 'package:chat_bot_app/screens/product_listing.dart';
import 'package:flutter/material.dart';

class category_button extends StatelessWidget {
  final categoryName;
  final Map<String, dynamic> item;
  final VoidCallback onPress;
  const category_button(
      {super.key,
      required this.categoryName,
      required this.item,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue.shade200,
          side: const BorderSide(style: BorderStyle.solid),
        ),
        onPressed: onPress,
        child: Text(categoryName));
  }
}
