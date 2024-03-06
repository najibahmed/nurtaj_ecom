import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

import '../Views/detail/product_details_page.dart';

class CardItemHorizontal extends StatelessWidget {
  final ProductModel productModel;
  const CardItemHorizontal({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=>Navigator.pushNamed(context, ProductDetails.routeName,arguments: productModel),
        child: Card(
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            height: 180,
            width: 125.7,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: 98,
                        width: 98,
                        child: Image.asset(productModel.image)),
                    Text(
                      productModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 2,
                      ),
                    ),
                    // Text(
                    //   productModel.description,
                    //   style: TextStyle(
                    //       fontSize: 10, color: Colors.black.withOpacity(.75)),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
