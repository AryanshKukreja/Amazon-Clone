import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Clone'),
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          Product product = productProvider.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
            leading: Image.network(product.imageUrl),
            onTap: () {
              Navigator.pushNamed(context, '/product', arguments: product);
            },
          );
        },
      ),
    );
  }
}
