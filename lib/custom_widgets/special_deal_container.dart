import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/home/controller/dashBoard_controller.dart';
import 'package:nurtaj_ecom_home/custom_widgets/cardItemHorixontal.dart';
import 'package:nurtaj_ecom_home/custom_widgets/countdown_timer.dart';


class SpecialDealContainer extends StatelessWidget {
  const SpecialDealContainer({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController dashBoardController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/gradient.png",
          ),
        )),
        width: MediaQuery.of(context).size.width * 1,
        height: 265,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: SizedBox(
                        width: 170,
                        height: 30,
                        child: const Text(
                          "Today's Special Deal",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Timer Countdown Widget
                  const CountDownTimer(),
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
            )
          ],
        ),
      ),
    );
  }
}
