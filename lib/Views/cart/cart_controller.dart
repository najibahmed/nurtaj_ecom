import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/models/category_model.dart';
import 'package:nurtaj_ecom_home/models/product_models.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  bool isProductInCart(String pid) {
    bool tag = false;
    for (final cartModel in cartList) {
      if (cartModel.productId == pid) {
        tag = true;
        break;
      }
    }
    return tag;
  }

  void addToCart(ProductModels productModel) {
    final cartModel = CartModel(
        productName: productModel.productName,
        productImageUrl: productModel.thumbnailImageUrl,
        productId: productModel.productId!,
        categoryId: productModel.category.categoryId!,
        salePrice: productModel.salePrice);
    return cartList.add(cartModel);
  }

  void increaseQuantity(CartModel cartModel) {
    cartModel.quantity += 1;
  }

  void decreaseQuantity(CartModel cartModel) {
    if (cartModel.quantity > 1) {
      cartModel.quantity -= 1;
    }
  }

  List<ProductModels> productList = [
    ProductModels(
        productName: "Apple HeadPhone",
        category: CategoryModel(categoryName: 'Mobile Accessories'),
        salePrice: 200,
        stock: 15,
        thumbnailImageUrl: "assets/appleHeadPhone.png",
        additionalImages: [
          "assets/appleHeadPhone.png",
          "assets/appleHeadPhone.png",
          "assets/appleHeadPhone.png"
        ]),
    ProductModels(
        productName: "Men Suite",
        category: CategoryModel(categoryName: 'Men Fashion'),
        salePrice: 500,
        stock: 13,
        thumbnailImageUrl: "assets/men_suite.png",
        additionalImages: [
          "assets/men_suite.png",
          "assets/men_suite.png",
          "assets/men_suite.png"
        ]),
    ProductModels(
        productName: "iPhone 12 Pro",
        category: CategoryModel(categoryName: 'Smart Phone'),
        salePrice: 50000,
        stock: 15,
        thumbnailImageUrl: "assets/iPhone.png",
        additionalImages: [
          "assets/iPhone.png",
          "assets/iPhone.png",
          "assets/iPhone.png"
        ]),
    ProductModels(
        productName:  "i Watch 2",
        category: CategoryModel(categoryName: 'Smart Watch'),
        salePrice: 15000,
        stock: 15,
        thumbnailImageUrl: "assets/watch.png",
        additionalImages: [
          "assets/watch.png", "assets/watch.png", "assets/watch.png"
        ]),
    ProductModels(
        productName: "Wallet Men",
        category: CategoryModel(categoryName: 'Accessories'),
        salePrice: 1000,
        stock: 15,
        thumbnailImageUrl: "assets/wallet.png",
        additionalImages: [
          "assets/wallet.png","assets/wallet.png","assets/wallet.png"
        ]),
  ];
}


