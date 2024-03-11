import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Sign%20Up/otp_varification_screen.dart';
import 'Views/authentication/Sign Up/sign_up_page.dart';
import 'Views/authentication/login/signIn_page.dart';
import 'Views/cart/cart_page.dart';
import 'Views/home/home_page.dart';
import 'Views/product details/product_details_page.dart';
import 'Views/user profile/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
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
        UserProfilePage.routeName :(_) => const UserProfilePage(),
        SignInPage.routeName :(_) => const SignInPage(),
        SignUpScreen.routeName :(_) => const SignUpScreen(),
      },
    );
  }
}

