import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 415,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),

      ),
      child: CarouselSlider(
        items: bannerList.map((item) {
          return InkWell(
            onTap: (){
              // Navigator.pushNamed(context, ProductDetails.routeName,arguments: item);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    height:180 ,
                    item.image,
                    fit: BoxFit.fill,

                  )),
            ),
          );
        }).toList(),
        options: CarouselOptions(
            viewportFraction: 1,
            height: 180,
            aspectRatio:16/9 ,
            // enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollPhysics: const BouncingScrollPhysics(),
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration:
            const Duration(milliseconds: 800)),
      ),
    );
  }
}
