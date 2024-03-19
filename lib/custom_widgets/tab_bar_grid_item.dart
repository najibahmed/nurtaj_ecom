import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

class TabBarGridItems extends StatelessWidget {
  const TabBarGridItems({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel productModel;
    return Stack(
      children: [
        GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              var item = categoryList[index];
              return InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Card(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        height: 180,
                        item.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
        Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
              onPressed: () {},
              child: Text(
                'Load More',
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
