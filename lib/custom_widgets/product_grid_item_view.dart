

import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

import '../Views/detail/product_details_page.dart';

class ProductGridItemView extends StatelessWidget {
  ProductModel productModel;

   ProductGridItemView({Key? key,required this.productModel })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>Navigator.pushNamed(context, ProductDetails.routeName,arguments: productModel),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(productModel.image,fit: BoxFit.contain,width: 186,
                      height: 150,)
                ),
                Text(productModel.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                Text(productModel.title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
