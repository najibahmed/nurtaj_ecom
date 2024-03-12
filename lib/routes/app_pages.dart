

import 'package:get/get_navigation/get_navigation.dart';
import 'package:nurtaj_ecom_home/Views/user%20profile/user_profile_page.dart';
import 'package:nurtaj_ecom_home/routes/app_routes.dart';

import '../Views/authentication/Sign Up/sign_up_page.dart';
import '../Views/authentication/login/signIn_page.dart';
import '../Views/cart/cart_page.dart';
import '../Views/home/dashBoard_page.dart';
import '../Views/product details/product_details_page.dart';

class AppPages {
  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => const DashBoardPage(),
    ),
GetPage(
      name: Paths.cart,
      page: () => const CartPage(),
    ),
    GetPage(
      name: Paths.productDetails,
      page: () => const ProductDetails(),
    ),
    GetPage(
      name: Paths.userProfile,
      page: () => const UserProfilePage(),
    ),
    GetPage(
      name: Paths.signIN,
      page: () => const SignInPage(),
    ),
GetPage(
      name: Paths.signUp,
      page: () => const SignUpScreen(),
    ),

  ];
}


