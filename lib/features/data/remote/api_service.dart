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
        data: {"phone": userName, "password": password});
      if(response.statusCode==200) {
        return response.data['data']['token'];
      }
      if(response.statusCode==409){
        return response.data['data']['message'];
      }
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