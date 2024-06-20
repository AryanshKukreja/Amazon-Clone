import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/product_provider.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Amazon Clone',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/product': (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
