import 'package:chat_bot_app/components/product_listing_card.dart';
import 'package:chat_bot_app/provider/Products/category_provider.dart';
import 'package:chat_bot_app/screens/product_info.dart';
import 'package:chat_bot_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key});

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  Future<void> onPressProduct(
      Map<String, dynamic> item, BuildContext context) async {
    print("click on ${item['id']}");
    String productId = item['id'].toString();
    if (productId.isNotEmpty) {
      Response response = await Provider.of<CategoryProvider>(context, listen: false)
          .getProductInfo(productId);
      if (response.statusCode == 200) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ProductInfo()));
      } else {
        print("onPressProduct error:${response.statusMessage}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Product Listing"),
          centerTitle: true,
          backgroundColor: AppColors.APPBAR_COLOR,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: category.productlisting.length,
                      itemBuilder: (context, index) {
                        final item = category.productlisting[index];
                        return GestureDetector(
                            onTap: () => onPressProduct(item, context),
                            child: ProductListingCard(
                              title: item['title'],
                              thumbnail: item['thumbnail'],
                              discription: item['description'],
                              product_id: item['id'],
                            ));
                      }))
            ],
          ),
        )),
      );
    });
  }
}
