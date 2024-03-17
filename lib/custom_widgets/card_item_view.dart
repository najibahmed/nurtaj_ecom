import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/models/cart_model.dart';

import '../Views/cart/cart_controller.dart';

class CartItemView extends StatelessWidget {
  CartModel cartModel;
  CartItemView({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController=Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(cartModel.productImageUrl),
              title: Text(cartModel.productName),
              subtitle: Text('Unit Price: \$${cartModel.salePrice}'),
              trailing: IconButton(
                onPressed: () {
                  cartController.removeFromCart(cartModel.productId);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    cartController.decreaseQuantity(cartModel);
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${cartModel.quantity}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartController.increaseQuantity(cartModel);
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$100',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
