import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/cart/cart_controller.dart';

import '../common/const/color.dart';
import '../routes/app_routes.dart';

class CartBubbleView extends StatelessWidget {
  const CartBubbleView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=Get.put(CartController());
    return InkWell(
        onTap: (){
          Get.toNamed(Routes.cart);
        },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            Positioned(
              left: -5,
              top: -5,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: MyColors.myBlue,
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  child: Obx((){
                      return Text('${cartController.cartList.length}',style:TextStyle(color: Colors.white));
                    }
                  ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
