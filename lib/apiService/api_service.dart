import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<Response> getData(String path) async {
    try {
      Response response = await dio.get(path);
      return response;
    } catch (e) {
      print("getData error>>> ${e.toString()}");
      throw e.toString();
    }
  }
}
