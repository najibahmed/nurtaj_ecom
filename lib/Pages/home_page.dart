
import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/Pages/cart_page.dart';
import 'package:nurtaj_ecom_home/custom_widgets/custom_horizontal_list.dart';
import 'package:nurtaj_ecom_home/custom_widgets/homepage_slider.dart';
import 'package:nurtaj_ecom_home/custom_widgets/product_grid_item_view.dart';
import 'package:nurtaj_ecom_home/custom_widgets/special_deal_container.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

import '../custom_widgets/custom_dawer.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/';
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  bool wait = false;
  String dropDownValue = "T-shirt";
  var categoryList = [
    "T-shirt",
    "Punjabi",
    "Electronic",
    "Mobile Phone",
    "Health Care",
    "Women Beauty",
    "Baby Care",
    "Bike",
    "Cycle",
    "Car",
    "Trimmer",
    "Shampoo",
  ];
  //
  // @override
  // void didChangeDependencies() {
  //   if(wait){
  //     print('check');
  //   Future.delayed(Duration(seconds: 5),(){
  //     wait=false;
  //   });
  //   }
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFFFFFF),
        // ),
        drawer: const DrawerPage(),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CartPage.routeName);
                        },
                        icon: const Icon(Icons.shopping_cart)),
                    // IconButton(
                    //     onPressed: () {}, icon: const Icon(Icons.person)),
                  ],
                ),
              ],
              pinned: true,
              elevation: 10,
              expandedHeight: 310,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
                background: ListView(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 7),
                      child: DropdownButtonFormField(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        elevation: 15,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 6, 10, 6),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(.75)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
                        isExpanded: true,
                        isDense: true,
                        // itemHeight: 50.0,
                        hint: const Text('Select Category'),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a category';
                          }
                          return null;
                        }, // Not necessary for Option 1
                        value: dropDownValue,
                        items: categoryList.map((String item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SliderBanner(),
                  )
                ]),
              )),
          SliverList(
              delegate: SliverChildListDelegate([
            const SpecialDealContainer(),
            const CustomHorizonList(
                title: 'Popular Categories', buttonTitle: "Load More"),
            const CustomHorizonList(
                title: 'Trendy Products', buttonTitle: "Shop More")
          ])),
          // Text("Only For You",
          //   style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Text("Only For You",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  childCount: specialDealList.length, (context, index) {
                final product = specialDealList[index];
                return ProductGridItemView(productModel: product);
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ))
        ]));
  }
}

