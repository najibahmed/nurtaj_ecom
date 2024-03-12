import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController{

  final signUpFormKey = GlobalKey<FormState>();
  final signInformKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailControllerSignUP = TextEditingController();
  TextEditingController passwordControllerSignUp = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailControllerSignIn = TextEditingController();
  TextEditingController passwordControllerSignIn = TextEditingController();
}