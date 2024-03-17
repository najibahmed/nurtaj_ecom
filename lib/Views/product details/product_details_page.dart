import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/cart/cart_controller.dart';
import 'package:nurtaj_ecom_home/Views/product%20details/controller/product_details_controller.dart';
import 'package:nurtaj_ecom_home/models/product_models.dart';
import '../../common/Helper Function/helper_function.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ProductDetailsController detailsController =
        Get.put(ProductDetailsController());
    final cartController = Get.put(CartController(), permanent: true);
    ProductModels productModel = Get.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(productModel.productName),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      extraImageShow(productModel.additionalImages[0]),
                      const SizedBox(width: 10),
                      extraImageShow(productModel.additionalImages[1]),
                      const SizedBox(width: 10),
                      extraImageShow(productModel.additionalImages[2]),
                    ],
                  ),
                )),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: productModel.productName,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      productModel.thumbnailImageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(15),
                // margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        productModel.productName,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                      child: Obx(() {
                        return OutlinedButton.icon(
                          onPressed: () {
                            detailsController.isfavourite.value =
                                detailsController.isfavourite.isFalse;
                          },
                          icon: Icon(detailsController.isfavourite.isTrue
                              ? Icons.favorite
                              : Icons.favorite_border_outlined),
                          label: Text(detailsController.isfavourite.isTrue
                              ? 'Remove From Favourite'
                              : 'ADD TO FAVORITE'),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GetX<CartController>(builder: (controller) {
                          bool isInCart =
                          cartController.isProductInCart(productModel.productId!);
                      return OutlinedButton.icon(
                        onPressed: () {
                          if (isInCart) {
                            controller.removeFromCart(productModel.productId!);
                          } else {
                            controller.addToCart(productModel);
                          }
                          // detailsController.inCart.value = detailsController.inCart.isFalse;
                        },
                        icon: Icon(isInCart
                            ? Icons.remove_shopping_cart
                            : Icons.add_shopping_cart),
                        label:
                            Text(isInCart ? 'Remove From Cart' : 'ADD TO Cart'),
                      );
                    }))
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Add your Rating'),
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
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              detailsController.userRating.value = rating;
                            },
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          EasyLoading.show(status: 'Please wait');
                          Future.delayed(Duration(seconds: 3), () {
                            EasyLoading.dismiss();
                            showMsg(
                                context, 'Please sign in to rate this product');
                          });
                          showMsg(context, 'Thanks for your rating');
                        },
                        child: const Text('SUBMIT'),
                      ),
                    ],
                  ),
                ),
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
                          controller: detailsController.commentController,
                          focusNode: detailsController.focusNode,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          if (detailsController
                              .commentController.text.isEmpty) {
                            showMsg(context, 'Please provide a comment');
                            return;
                          }
                          EasyLoading.show(status: 'Please wait');
                          Future.delayed(Duration(seconds: 3), () {
                            EasyLoading.dismiss();
                            detailsController.focusNode.unfocus();
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
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            url,
            fit: BoxFit.cover,
          )),
    );
  }
}
