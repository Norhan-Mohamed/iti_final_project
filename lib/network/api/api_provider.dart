import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class ApiProvider{
  ProductModel? productModel;
  Future<ProductModel?> getProduct()async{
    try{

      Response response = await Dio().get("https://dummyjson.com/products",queryParameters: {
        "select":"id,title,price,description,category,thumbnail",
        "limit":40,

      });
      productModel=ProductModel.fromJson(response.data);
      print(productModel?.products![0].title);
      return productModel;
    }catch(e){
      print(e);
      return null;
    }
  }
  Future userLogin({required String userName, required String password})async{
    final SharedPreferences preferences= await  SharedPreferences.getInstance();
    try{
      FormData userData= FormData.fromMap({
        "username":userName,
        "password":password});
      Response response=
      await Dio().post("https://dummyjson.com/auth/login",
          data: userData);
      await preferences.setString("userTaken", response.data["token"]);
      String? userToken =preferences.getString("userToken");
      print("user Token=> $userToken");
      return "Login success";
    }catch(e){
      if(e is DioException){
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      }

    }
  }


  Future<List<String>> fetchCategories() async {
  try {
  final response = await Dio().get('https://dummyjson.com/products/categories');
  List<String> categories = List<String>.from(response.data);
  return categories;
  } catch (e) {
  print('Error fetching categories: $e');
  throw Exception('Failed to load categories');
  }
  }



}
