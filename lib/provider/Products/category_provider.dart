import 'package:chat_bot_app/apiService/api_service.dart';
import 'package:chat_bot_app/utils/constant.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<dynamic> _categoryList = [];

  List<dynamic> get categoryList => _categoryList;

  Future<void> getCategory() async {
    try {
      final response = await ApiService().getData(URL.GET_CATEGORY);
      if (response.statusCode == 200) {
        _categoryList = response.data;
        print("categoryList>>>> $_categoryList");
      } else {
        print("getCategory else>>>${response.statusMessage}");
      }
    } catch (e) {
      print("error>> ${e.toString()}");
    } finally {
      notifyListeners();
    }
  }
}
