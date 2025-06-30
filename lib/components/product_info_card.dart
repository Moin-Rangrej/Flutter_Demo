import 'package:chat_bot_app/components/label.dart';
import 'package:chat_bot_app/components/product_image_indicator.dart';
import 'package:flutter/material.dart';

class ProductInfoCard extends StatefulWidget {
  final String title;
  final String discription;
  final double price;
  final List<dynamic> imageList;
  final PageController pageController;

  const ProductInfoCard({
    super.key,
    required this.title,
    required this.discription,
    required this.price,
    required this.imageList,
    required this.pageController,
  });

  @override
  State<ProductInfoCard> createState() => _ProductInfoCardState();
}

class _ProductInfoCardState extends State<ProductInfoCard> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.35,
          child: PageView.builder(
              itemCount: widget.imageList.length,
              pageSnapping: true,
              controller: widget.pageController,
              onPageChanged: (int page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      widget.imageList[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ));
              }),
        ),
        ProductImageIndicator(
            imageList: widget.imageList, currentIndex: activePage),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(
                  text: "Title: ${widget.title}",
                  style: const TextStyle(fontSize: 20, fontFamily: "Lubri")),
              Label(
                text: "Discription: ${widget.discription}",
                style: const TextStyle(fontFamily: "Lubri", fontSize: 20),
              ),
              Label(
                text: "Price: ${widget.price}",
                style: const TextStyle(fontFamily: "Lubri", fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
