import 'package:flutter/material.dart';
import 'package:product_buy_sell/model_class/product_model.dart';
import 'package:product_buy_sell/screens/product_details_screen.dart';
import 'package:product_buy_sell/service/product_service.dart';


class HomeProductScreen extends StatefulWidget {
  const HomeProductScreen({Key? key}) : super(key: key);

  @override
  State<HomeProductScreen> createState() => _HomeProductScreenState();
}

class _HomeProductScreenState extends State<HomeProductScreen> {
  late ProductApiService productApiService;
  List<ProductModel> productModels = [];

  @override
  void initState() {
    productApiService = ProductApiService();
    super.initState();
    getProduct();
  }

  getProduct() async {
    productModels = await ProductApiService.getProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ListView.builder(
        itemCount: productModels.length,
        itemBuilder: (context, index) {
          ProductModel product = productModels[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ProductDetailScreen(productModel: product,);
              }));
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(product!.images?[0] ?? ''),
                  ListTile(
                    title: Text(product.title.toString()),
                    subtitle: Text("\u0024${product.price.toString()}"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}