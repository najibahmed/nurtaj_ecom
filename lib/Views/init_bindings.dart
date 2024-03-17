import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Controller/authentication_controller.dart';
import 'package:nurtaj_ecom_home/Views/cart/cart_controller.dart';
import 'package:nurtaj_ecom_home/Views/home/controller/dashBoard_controller.dart';
import 'package:nurtaj_ecom_home/Views/product%20details/controller/product_details_controller.dart';

class InitBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProductDetailsController());
    Get.lazyPut(() => AuthenticationController());
    // TODO: implement dependencies
  }

}