import 'package:flutter/material.dart';

class ProductListingCard extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String discription;
  final int product_id;
  const ProductListingCard(
      {super.key,
      required this.title,
      required this.thumbnail,
      required this.discription,
      required this.product_id
      });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(thumbnail)),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title:$title",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontFamily: "Ubuntu"),
                ),
                Text(
                  "Discription:$discription",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontFamily: "Ubuntu"),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
