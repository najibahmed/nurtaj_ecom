import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:nurtaj_ecom_home/models/product_models.dart';

import '../../models/cart_model.dart';

class CartController extends GetxController {

  RxList cartList=<CartModel>[
    // CartModel(
    //     productId: '180102',
    //     categoryId: '180118',
    //     productName: 'Men suite',
    //     productImageUrl: 'assets/men_suite.png',
    //     salePrice: 20
    // )
  ].obs;
  bool isProductInCart(String pid) {
    RxBool tag = false.obs;
    for (final cartModel in cartList) {
      if (cartModel.productId == pid) {
        tag.value = true;
        break;
      }
    }
    return tag.value;
  }

  void addToCart(ProductModels productModel) {
    final cartModel = CartModel(
        productName: productModel.productName,
        productImageUrl: productModel.thumbnailImageUrl,
        productId: productModel.productId!,
        // categoryId: productModel.category.categoryId!,
        salePrice: productModel.salePrice);
    return cartList.add(cartModel);
  }
  
  void removeFromCart(String s) {

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


