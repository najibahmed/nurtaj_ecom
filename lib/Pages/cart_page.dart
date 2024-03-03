import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/custom_widgets/card_item_view.dart';
import 'package:nurtaj_ecom_home/models/cart_model.dart';

class CartPage extends StatefulWidget {
  static const String routeName= '/cartPage';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final cartModel = cartList[index];
                  return CartItemView( cartModel: cartModel,);
                },
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          'SUB TOTAL: \$100',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                    OutlinedButton(
                      onPressed:(){},
                      child: const Text('CHEKCOUT'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
