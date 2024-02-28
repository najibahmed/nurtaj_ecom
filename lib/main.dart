import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/Pages/cart_page.dart';
import 'package:nurtaj_ecom_home/Pages/home_page.dart';
import 'package:nurtaj_ecom_home/Pages/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName :(_) => const MyHomePage(),
        CartPage.routeName :(_) => const CartPage(),
        ProductDetails.routeName :(_) => const ProductDetails(),
      },
    );
  }
}

