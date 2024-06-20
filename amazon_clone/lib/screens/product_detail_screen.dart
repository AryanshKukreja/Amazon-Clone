import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.imageUrl),
          SizedBox(height: 10),
          Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('\$${product.price}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(product.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          // Add to cart functionality
        },
      ),
    );
  }
}
