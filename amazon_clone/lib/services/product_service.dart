import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    QuerySnapshot snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) {
      return Product(
        id: doc.id,
        name: doc['name'],
        description: doc['description'],
        price: doc['price'],
        imageUrl: doc['imageUrl'],
      );
    }).toList();
  }
}
