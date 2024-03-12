

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

import '../Views/product details/product_details_page.dart';
import '../models/product_models.dart';

class ProductGridItemView extends StatelessWidget {
    ProductModels productModel;
    ProductGridItemView({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>Get.to(ProductDetails(),arguments:productModel),
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
                    child: Image.asset(productModel.thumbnailImageUrl,fit: BoxFit.contain,width: 186,
                      height: 150,)
                ),
                Text(productModel.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                Text(productModel.salePrice.toString(),
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
