import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:product_buy_sell/model_class/product_model.dart';
import 'package:product_buy_sell/util/api_end_point.dart';


class ProductApiService {
  static Future<List<ProductModel>> getProducts() async {
    String url = ApiEndPoint.baseUrl;
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }

      final List<dynamic> jsonResponse = jsonDecode(response.body);
      final List<ProductModel> products = jsonResponse.map((data) {
        return ProductModel.fromJson(data);
      }).toList();

      return products;
    } else {
      throw 'Something went wrong';
    }
  }
}
// import 'dart:convert';
//
//
// import 'package:http/http.dart' as http;
// import 'package:product_buy_sell/model_class/product_model.dart';
// import 'package:product_buy_sell/util/api_end_point.dart';
//
//
// class ProductApiService{
//   Future<List<ProductModel>> getProductInfo() async {
//     String url = ApiEndPoint.baseUrl;
//     http.Response response = await http.get(
//       Uri.parse(url),
//
//     );
//     if (response.statusCode == 200) {
//       String body = response.body;
//       final data = jsonDecode(body);
//
//       ProductResponseList productResponseList= ProductResponseList.fromJson(data);
//       return productResponseList.products;
//     } else {
//       throw 'Something went wrong';
//     }
//   }
// }