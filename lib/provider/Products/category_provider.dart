import 'package:chat_bot_app/apiService/api_service.dart';
import 'package:chat_bot_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<dynamic> _categoryList = [];
  bool _isCategoryLoad = false;
  List<dynamic> _productlisting = [];
  Map<String, dynamic>  _productInfo = {};

  List<dynamic> get categoryList => _categoryList;
  bool get isCategoryLoad => _isCategoryLoad;
  List<dynamic> get productlisting => _productlisting;
  Map<String, dynamic>  get productInfo => _productInfo;

  Future<void> getCategory() async {
    try {
      final response = await ApiService().getData(URL.GET_CATEGORY);
      _isCategoryLoad = true;
      if (response.statusCode == 200) {
        _categoryList = response.data;
      } else {
        print("getCategory else>>>${response.statusMessage}");
      }
    } catch (e) {
      print("error>> ${e.toString()}");
    } finally {
      _isCategoryLoad = false;
      notifyListeners();
    }
  }

  Future<Response> categoryListing(String endpoint) async {
    try {
      String apiurl = URL.CATEGORY_LISTING + endpoint;
      final Response response = await ApiService().getData(apiurl);
      if (response.statusCode == 200) {
        _productlisting = response.data['products'];
        return response;
      } else {
        print("categoryListing Fail: ${response.statusMessage}");
        return response;
      }
    } catch (e) {
      print("categoryListing error ${e.toString()}");
      throw e;
    } finally {
      notifyListeners();
    }
  }

  Future<Response> getProductInfo(String id) async {
    try {
      String apiUrl = URL.PRODUCT_INFO + id.toString();
      print("apiUrl>> $apiUrl");
      Response response = await ApiService().getData(apiUrl);
      if (response.statusCode == 200) {
        _productInfo = response.data;
        return response;
      } else {
        print("getProductInfo fail>> ${response.statusMessage}");
        return response;
      }
    } catch (e) {
      print("getProductInfo error:${e.toString()}");
      throw e;
    } finally {
      notifyListeners();
    }
  }
}
