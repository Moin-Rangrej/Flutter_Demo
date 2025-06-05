import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  Dio dio = Dio();

  int count = 0;

  void increament() {
    count++;
    notifyListeners();
  }
}
