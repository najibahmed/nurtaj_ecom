import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/cart_model.dart';

class CartItemView extends StatelessWidget {
  CartModel cartModel;
  CartItemView({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '5',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
