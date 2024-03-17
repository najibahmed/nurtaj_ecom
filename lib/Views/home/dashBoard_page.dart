import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/cart/cart_controller.dart';
import 'package:nurtaj_ecom_home/Views/home/controller/dashBoard_controller.dart';
import 'package:nurtaj_ecom_home/custom_widgets/custom_horizontal_list.dart';
import 'package:nurtaj_ecom_home/custom_widgets/homepage_slider.dart';
import 'package:nurtaj_ecom_home/custom_widgets/product_grid_item_view.dart';
import 'package:nurtaj_ecom_home/custom_widgets/special_deal_container.dart';
import 'package:nurtaj_ecom_home/routes/app_routes.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../common/const/color.dart';
import '../../common/const/constants.dart';
import '../Drawer/custom_dawer.dart';
import '../../custom_widgets/custom_tab_view.dart';
import '../cart/cart_page.dart';
import '../user profile/user_profile_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  PageController controller = PageController();
  dynamic selected;

  @override
  Widget build(BuildContext context) {
    DashBoardController dashBoardController=Get.find();
    return Scaffold(
      extendBody: true,

      ///bottom navigation bar
      bottomNavigationBar: StylishBottomBar(
          items: [
            BottomBarItem(
              icon: const Icon(
                Icons.house_outlined,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.blue,
              unSelectedColor: Colors.deepOrangeAccent,
              title: const Text('Home'),
              // badge: const Text('9+'),
              // showBadge: true,
            ),
            BottomBarItem(
                icon: const Icon(
                  Icons.notifications,
                ),
                selectedIcon: const Icon(
                  Icons.notifications_active,
                ),
                unSelectedColor: Colors.deepOrangeAccent,
                selectedColor: Colors.blue,
                title: const Text('Style')),
            BottomBarItem(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                selectedIcon: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                ),
                unSelectedColor: Colors.deepOrangeAccent,
                selectedColor: Colors.blue,
                title: const Text('Style')),
            BottomBarItem(
                icon: const Icon(
                  Icons.person_outline,
                ),
                selectedIcon: const Icon(
                  Icons.person,
                ),
                unSelectedColor: Colors.deepOrangeAccent,
                selectedColor: Colors.blue,
                title: const Text('Profile')),
          ],
          borderRadius: BorderRadius.circular(20),
          option: AnimatedBarOptions(
            iconSize: 32,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.animated,
          ),
          // hasNotch: true,
          currentIndex: selected ?? 0,
          // fabLocation: StylishBarFabLocation.center,
          onTap: (index) {
            setState(() {
              selected=index;
              controller.jumpToPage(index);
            });
          },
        ),

      /// floating action button
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //     onPressed: (){},
      //     child: Icon(Icons.add)
      // ),

      ///Custom Drawer Page
      drawer: const DrawerPage(),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            CustomScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverAppBar(
                      backgroundColor: Colors.white,
                      // backgroundColor: Color(0xFF42A5F5),
                      centerTitle: true,

                      /// Search Bar
                      title: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: _itemSearchDelegate());
                            },
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.25),
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(width: 1, color: Colors.black),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.search_outlined,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      // letterSpacing: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /// Action Buttons
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // Get.to(const CartPage());
                                    Get.toNamed(Routes.cart);
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: MyColors.myBlue,
                                  )),
                            ],
                          ),
                        ),
                      ],
                      pinned: true,
                      // elevation: 10,
                      expandedHeight: 240,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        stretchModes: const [
                          StretchMode.zoomBackground,
                        ],
                        background: ListView(children: const [
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),

                            /// Show sliding Banner
                            child: SliderBanner(),
                          )
                        ]),
                      )),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    ///Special Deal Horizontal Scrolling Custom Card
                    const SpecialDealContainer(),

                    /// Tab Bar  Start From here
                    const CustomTabView(),

                    ///Popular Categories Horizontal Scrolling Custom Card
                    const CustomHorizonList(
                        title: 'Popular Categories', buttonTitle: "Load More"),

                    ///Trendy Products Horizontal Scrolling Custom Card
                    const CustomHorizonList(
                        title: 'Trendy Products', buttonTitle: "Shop More")
                  ])),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        "Only For You",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),

                  /// Bottom Grid List Custom Card View
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          childCount: dashBoardController.productList.length, (context, index) {
                        final product = dashBoardController.productList[index];
                        return ProductGridItemView( productModel: product,);
                      }),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ))
                ]),
            const Center(child: Text('Star')),
            const CartPage(),
            const UserProfilePage()
          ],
        ),
      ),
    );
  }
}

class _itemSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear, color: MyColors.myBlue))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back, color: MyColors.myBlue));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      tileColor: Colors.purple.shade50,
      onTap: () {
        close(context, query);
      },
      title: Text(query),
      leading: const Icon(
        Icons.search,
        color: MyColors.myBlue,
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredList = query.isEmpty
        ? categoryList
        : categoryList
            .where((category) =>
                category.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final item = filteredList[index];
        return ListTile(
          tileColor: Colors.grey[200],
          onTap: () {
            query = item;
            close(context, query);
          },
          title: Text(item),
        );
      },
    );
    throw UnimplementedError();
  }
}
