import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:nurtaj_ecom_home/Pages/cart_page.dart';
import 'package:nurtaj_ecom_home/custom_widgets/custom_horizontal_list.dart';
import 'package:nurtaj_ecom_home/custom_widgets/homepage_slider.dart';
import 'package:nurtaj_ecom_home/custom_widgets/product_grid_item_view.dart';
import 'package:nurtaj_ecom_home/custom_widgets/special_deal_container.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';
import '../custom_widgets/custom_dawer.dart';
import '../custom_widgets/custom_tab_view.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xFFFFFF),
        // ),
        ///Custom Drawer Page
        drawer: const DrawerPage(),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
                backgroundColor: Colors.white,
                // backgroundColor: Color(0xFF42A5F5),
                title: SizedBox(
                    height: 40,
                    width: 70,
                    child: Image.asset(
                      'nurtaj.png',
                      fit: BoxFit.cover,
                    )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.person)),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, CartPage.routeName);
                            },
                            icon: const Icon(Icons.shopping_cart)),
                      ],
                    ),
                  ),
                ],
                pinned: true,
                // elevation: 10,
                expandedHeight: 310,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  stretchModes: const [
                    StretchMode.zoomBackground,
                  ],
                  background: ListView(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),

                        /// Drop Down Search Bar
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
              ///Special Deal Horizontal Scrolling Custom Card
              const SpecialDealContainer(),

              /// Tab Bar  Start From here
              CustomTabView(),

              ///Popular Categories Horizontal Scrolling Custom Card
              const CustomHorizonList(
                  title: 'Popular Categories', buttonTitle: "Load More"),

              ///Trendy Products Horizontal Scrolling Custom Card
              const CustomHorizonList(
                  title: 'Trendy Products', buttonTitle: "Shop More")
            ])),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  "Only For You",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            /// Bottom Grid List Custom Card View
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
          ]),
        ));
  }
}
