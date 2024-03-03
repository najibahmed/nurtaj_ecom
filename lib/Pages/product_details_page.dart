
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nurtaj_ecom_home/models/product_model.dart';

import '../Helper Function/helper_function.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const String routeName = "/productDetails";
  @override
  State<ProductDetails> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<ProductDetails> {
  late ProductModel product;
  bool inCart=false;
  bool isfavourite=false;
  double userRating=0;
  TextEditingController txtController=TextEditingController();
  FocusNode focusNode=FocusNode();

  @override
  void dispose() {
    txtController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
     product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(product.title),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      extraImageShow(product.image),
                      const SizedBox(width: 10),
                      extraImageShow(product.image),
                    ],
                  ),
                )),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag:product.title,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(product.image,
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        product.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    //
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            isfavourite=!isfavourite;
                          });
                        },
                        icon: Icon(isfavourite? Icons.favorite: Icons.favorite_border_outlined),
                        label: Text(isfavourite? 'Remove From Favourite':'ADD TO FAVORITE'),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            inCart=!inCart;
                          });
                        },
                        icon:  Icon(inCart? Icons.remove_shopping_cart:Icons.add_shopping_cart ),
                        label: Text(inCart? 'Remove From Cart':'ADD TO Cart'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: RatingBar.builder(
                    initialRating: 0.0,
                    minRating: 0.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      userRating = rating;
                    },
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  EasyLoading.show(status: 'Please wait');
                  Future.delayed(Duration(seconds: 3),(){
                    EasyLoading.dismiss();
                    showMsg(context, 'Please sign in to rate this product');
                  });
                  showMsg(context, 'Thanks for your rating');
                },
                child: const Text('SUBMIT'),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Text('Add your Comment'),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          maxLines: 3,
                          controller: txtController,
                          focusNode: focusNode,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          EasyLoading.show(status: 'Please wait');
                          Future.delayed(Duration(seconds: 3),(){
                            EasyLoading.dismiss();
                            focusNode.unfocus();
                          });
                        },
                        child: const Text('SUBMIT'),
                      )
                    ],
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container extraImageShow(String url) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(url,
        fit: BoxFit.fitHeight,
        )
      ),
    );
  }
}
