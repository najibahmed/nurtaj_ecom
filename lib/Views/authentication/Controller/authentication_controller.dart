import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController{

  final signUpFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailControllerSignIn = TextEditingController();
  TextEditingController passwordControllerSignIn = TextEditingController();
}