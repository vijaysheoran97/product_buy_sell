import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_buy_sell/model_class/product_model.dart';
import 'package:product_buy_sell/screens/response_screen.dart';
import 'package:product_buy_sell/util/api_end_point.dart';

class ProductService {
  Future<List<ProductModel>> getProduct() async {
    String url = ApiEndPoint.baseUrl;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);
      ProductResponse productResponse = ProductResponse.fromJson(data);
      return productResponse.products;
    } else {
      throw 'Something went wrong';
    }
  }
}