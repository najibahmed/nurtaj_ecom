import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/cart/cart_controller.dart';

import 'package:nurtaj_ecom_home/custom_widgets/card_item_view.dart';
import 'package:nurtaj_ecom_home/models/cart_model.dart';

class CartPage extends StatefulWidget {
  static const String routeName = '/cartPage';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartList.length,
                itemBuilder: (context, index) {
                  final cartModel = cartController.cartList[index];
                  return CartItemView(
                    cartModel: cartModel,
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'SUB TOTAL: ',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('CHEKCOUT'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
