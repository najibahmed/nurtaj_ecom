import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/home/controller/dashBoard_controller.dart';

import '../Views/cart/cart_controller.dart';
import '../models/product_model.dart';
import 'cardItemHorixontal.dart';

class CustomHorizonList extends StatelessWidget {
  final String title;
  final String buttonTitle;
  const CustomHorizonList(
      {super.key, required this.title, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    final dashBoardController = Get.put(DashBoardController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      width: 200,
                      height: 30,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dashBoardController.productList.length,
                  itemBuilder: (context, index) {
                    return CardItemHorizontal(
                        productModel: dashBoardController.productList[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    buttonTitle,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
