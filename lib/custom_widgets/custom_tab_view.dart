import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurtaj_ecom_home/custom_widgets/tab_bar_grid_item.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: SizedBox(
          height: 300,
          child: Column(
          children: [
            Container(
            width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2,color: Colors.grey.withOpacity(.55))
              ),
              child: ButtonsTabBar(
                contentPadding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                radius: 12,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: Icon(Icons.local_offer_outlined),
                    text: "Deal 1",
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.local_offer_outlined),
                    text: "Deal 2",
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.local_offer_outlined),
                    text: "Deal 3",
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.local_offer_outlined),
                    text: "Deal 4",
                    height: 50,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  child: TabBarView(
                    children: <Widget>[
                      TabBarGridItems(),
                      TabBarGridItems(),
                      Center(
                        child: Icon(Icons.directions_car),
                      ),
                      Center(
                        child: Icon(Icons.directions_transit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],),
        ));
  }


}
