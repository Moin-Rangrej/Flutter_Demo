import 'package:flutter/material.dart';

class ProductImageIndicator extends StatefulWidget {
  final List<dynamic> imageList;
  final int currentIndex;
  const ProductImageIndicator(
      {super.key, required this.imageList, required this.currentIndex});

  @override
  State<ProductImageIndicator> createState() => _ProductImageIndicatorState();
}

class _ProductImageIndicatorState extends State<ProductImageIndicator> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.imageList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.01),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: widget.currentIndex == index
                    ? Colors.black
                    : Colors.black26,
                shape: BoxShape.circle),
          );
        }),
      ),
    );
  }
}
