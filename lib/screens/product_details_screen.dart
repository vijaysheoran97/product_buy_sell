import 'package:flutter/material.dart';
import 'package:product_buy_sell/model_class/product_model.dart';



class ProductDetailScreen extends StatefulWidget {
  ProductModel productModel;

  ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                widget.productModel.images![0],
                width: 250,
                height: 250,
              ),
            ),
            ListTile(
              title: Text(
                  widget.productModel.title.toString()
              ),
              subtitle: Text('\u0024${widget.productModel.price.toString()}'),
              trailing: Column(
                children: [
                  const Text(
                    'Ratting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      widget.productModel.price.toString()
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(widget.productModel.description.toString()),
            )
          ],
        ),
      ),
    );
  }
}