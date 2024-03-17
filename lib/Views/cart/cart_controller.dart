import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:nurtaj_ecom_home/models/product_models.dart';

import '../../models/cart_model.dart';

class CartController extends GetxController {

  List<CartModel> cartList=<CartModel>[].obs;

  bool isProductInCart(String pid) {
    RxBool tag = false.obs;
    for (final cartModel in cartList) {
      if (cartModel.productId == pid) {
        tag.toggle();
        break;
      }
    }
    return tag.value;
  }

  void addToCart(ProductModels productModel) {
    print('adding');
    var cartModel = CartModel(
        productName: productModel.productName,
        productImageUrl: productModel.thumbnailImageUrl,
        productId: productModel.productId!,
        salePrice: productModel.salePrice);
    return cartList.add(cartModel);
  }
  
  void removeFromCart(String s) {
    print('remove');
    return  cartList.removeWhere((element) => element.productId =='s');
  }

  void increaseQuantity(CartModel cartModel) {
    cartModel.quantity += 1;
  }

  void decreaseQuantity(CartModel cartModel) {
    if (cartModel.quantity > 1) {
      cartModel.quantity -= 1;
    }
  }






}


