import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/Pages/product_details_page.dart';
import 'package:nurtaj_ecom_home/custom_widgets/cardItemHorixontal.dart';
import 'package:nurtaj_ecom_home/custom_widgets/countdown_timer.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

class SpecialDealContainer extends StatelessWidget {
  const SpecialDealContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "gradient.png",
          ),
        )),
        width: 415,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      width: 180,
                      height: 30,
                      child: const Text(
                        "Today Special Deal",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          // fontWeight: FontWeight.bold
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
                  itemCount: specialDealList.length,
                  itemBuilder: (context, index) {
                    return CardItemHorizontal(
                      productModel: specialDealList[index]);
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
