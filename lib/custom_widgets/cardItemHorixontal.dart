import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../Views/product details/product_details_page.dart';
import '../common/const/color.dart';
import '../common/const/constants.dart';
import '../models/product_models.dart';

class CardItemHorizontal extends StatelessWidget {
  final ProductModels productModel;
  const CardItemHorizontal({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(()=>ProductDetails(),arguments:productModel),
        child: Card(
          elevation: 8,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 200,
                width: 130.7,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(productModel.thumbnailImageUrl)),
                      ),
                      Wrap(
                        children: [
                          Text(
                            productModel.productName,
                            style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 1,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrangeAccent,
                            size: 12,
                          ),
                          // SizedBox(width: 5),
                          Text(
                            ' 4.5/5.',
                            style: const TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '100.1k Sold',
                            style: const TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      RichText(
                          text: TextSpan(
                              text: '${currency_logo} 255  ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MyColors.myBlue,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                            TextSpan(
                              text: '${currency_logo}280',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.76),
                                  fontWeight: FontWeight.bold),
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(.10),
                    height: 20,
                    width: 80,
                    child: Text(
                      ' 20% OFF',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ))
            ],
          ),
        ));
  }
}
