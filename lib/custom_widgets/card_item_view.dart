
import 'package:flutter/material.dart';


class CartItemView extends StatelessWidget {
  const CartItemView(
      {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('polo_shirt.png'),
                title: Text("Polo Shrit"),
                subtitle: Text('Unit Price: \$20'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                    },
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
                    onPressed: () {
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
        ));
  }
}
