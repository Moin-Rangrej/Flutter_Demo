import 'package:chat_bot_app/components/product_info_card.dart';
import 'package:chat_bot_app/provider/Products/category_provider.dart';
import 'package:chat_bot_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, product, _) {
      print("product info>>> ${product.productInfo['title']}");
      String title = product.productInfo['title'] ?? "";
      String discription = product.productInfo['description'] ?? "";
      List<dynamic> imageList = product.productInfo['images'] ?? [];
      double price = product.productInfo['price'] ?? "";
      return Scaffold(
          appBar: AppBar(
            title: const Text("Product Information"),
            centerTitle: true,
            backgroundColor: AppColors.APPBAR_COLOR,
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfoCard(
                    title: title,
                    discription: discription,
                    price: price,
                    imageList: imageList,
                    pageController: _pageController)
              ],
            ),
          )));
    });
  }
}
