import 'package:chat_bot_app/provider/Products/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  void didChangeDependencies() {
    // fetchCategory();
    super.didChangeDependencies();
  }

  Future<void> fetchCategory() async {
    await Provider.of<CategoryProvider>(context).getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Category"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("data"),
      )),
    );
  }
}
