import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ProductDetailsController extends GetxController{


  var isfavourite = false.obs;
  RxDouble userRating = 0.0.obs as RxDouble;
  TextEditingController commentController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void onClose() {
    // TODO: implement onClose
    commentController.clear();
    super.onClose();
  }
}