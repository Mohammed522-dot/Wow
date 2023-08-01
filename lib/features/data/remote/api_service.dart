
import 'package:dio/dio.dart';
import 'package:wow/core/utils/app_strings.dart';

class ApiService {
  late Dio dio;
  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<dynamic> logIn(String userName,String password) async {
    try {
      var response = await dio.post('login',
        data: {"username": userName, "password": password},);
      return response.data['token'];
    } catch (e) {
      print(e.toString());
    }
  }
  Future<List<dynamic>> getProducts() async {
    try {
      var response = await dio.get('products');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}