import 'package:chat_bot_app/provider/Products/category_provider.dart';
import 'package:chat_bot_app/screens/product_listing.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_button.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    await Provider.of<CategoryProvider>(context, listen: false).getCategory();
  }

  Future<void> onPressCategory(Map<String, dynamic> item) async {
    print("item>> ${item['slug']}");
    String categoryName = item['slug'];
    if (categoryName.isNotEmpty) {
      Response response =
          await Provider.of<CategoryProvider>(context, listen: false)
              .categoryListing(categoryName);
      if (response.statusCode == 200) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProductListing()));
      } else {
        final message =
            SnackBar(content: Text(response.statusMessage.toString()));
        ScaffoldMessenger.of(context).showSnackBar(message);
      }
    } else {
      print("categoryName>> $categoryName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, category, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Product Category"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade300,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: category.isCategoryLoad
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : ListView.builder(
                          itemCount: category.categoryList.length,
                          itemBuilder: (context, index) {
                            final item = category.categoryList[index];
                            final categoryName = item['name'];
                            return category_button(
                              categoryName: categoryName,
                              item: item,
                              onPress: () => onPressCategory(item),
                            );
                          })),
            ],
          ),
        )),
      );
    });
  }
}
