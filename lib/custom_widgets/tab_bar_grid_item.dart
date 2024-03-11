import 'package:flutter/material.dart';

class tabBarGridItems extends StatelessWidget {
  const tabBarGridItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: 12,
            itemBuilder: (context, index) => InkWell(
              child: Card(
                child: Container(
                  height: 50,
                  width: 50,
                  child: FlutterLogo(),
                ),
              ),
            )),
        Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54
              ),
              onPressed: (){},
              child: Text('Load More',style: TextStyle(color: Colors.white),),
            )
        )
      ],
    );
  }
}
