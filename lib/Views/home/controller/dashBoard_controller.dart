import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';
import '../../../models/product_models.dart';

class DashBoardController extends GetxController{

  List<ProductModels> productList = [
    ProductModels(
        productId: '180101',
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
        productId: '180102',
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
        productId: '180103',
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
        productId: '180104',
        productName:  "i Watch 2",
        category: CategoryModel(categoryName: 'Smart Watch'),
        salePrice: 15000,
        stock: 15,
        thumbnailImageUrl: "assets/watch.png",
        additionalImages: [
          "assets/watch.png", "assets/watch.png", "assets/watch.png"
        ]),
    ProductModels(
        productId: '180105',
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