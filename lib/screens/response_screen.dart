import 'package:product_buy_sell/model_class/product_model.dart';

class ProductResponse {
  List<ProductModel> products = [];
  ProductResponse({required this.products});

  factory ProductResponse.fromJson(List<dynamic> json) {
    List<ProductModel> productList = [];
    for (var productJson in json) {
      productList.add(ProductModel.fromJson(productJson));
    }
    return ProductResponse(products: productList);
  }
}