import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Sign%20Up/otp_varification_screen.dart';
import 'package:nurtaj_ecom_home/Views/home/dashBoard_page.dart';
import 'package:nurtaj_ecom_home/common/tools/dialog.dart';
import 'package:nurtaj_ecom_home/sevices/cache_storage/local_storage.dart';
import '../../../models/user_model.dart';
import '../../../sevices/cache_storage/local_database.dart';

class AuthenticationController extends GetxController {
  late UserModel userModel;
  List<UserModel> userlist = [];

  final signUpFormKey = GlobalKey<FormState>();
  final signInformKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailControllerSignUP = TextEditingController();
  TextEditingController passwordControllerSignUp = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailControllerSignIn = TextEditingController();
  TextEditingController passwordControllerSignIn = TextEditingController();

  Future<bool> signIn(BuildContext context) async {
    EasyLoading.show(status: 'Wait..');
    // Map<String,dynamic> userMap={
    //   "email":emailControllerSignIn.text.trim(),
    //   'password':passwordControllerSignIn.text.trim()
    // };
    final user = await getUserByEmail(emailControllerSignIn.text.trim());
    if (user == null) {
      authenticationErrorDialog("Error Login", "User not Found");
      EasyLoading.dismiss();
      return false;
    } else {
      if (passwordControllerSignIn.text.trim() == user.imageUrl) {
        await LocalStorage.setLoginStatus(true);
        await LocalStorage.setUserId(user.userId as int);
        showSuccessDialogInTop("Information", "Login Successfully", context);
        Get.offAll(DashBoardPage(), transition: Transition.fadeIn);
        EasyLoading.dismiss();
        return true;
      } else {
        authenticationErrorDialog("Error Login", "Wrong Password");
        EasyLoading.dismiss();
        return false;
      }
      return false;
    }
  }

  Future<bool> signUp(BuildContext context) async {
    final user = await getUserByEmail(emailControllerSignIn.text.trim());
    if (user != null) {
      authenticationErrorDialog("Error Sign In", "Email Already Exist");
      return false;
    } else {
      final user = UserModel(
        userId: userId,
        email: emailControllerSignUP.text.trim(),
        imageUrl: passwordControllerSignUp.text.trim(),
      );
      final rowId = await insertUser(user);
      await LocalStorage.setLoginStatus(true);
      await LocalStorage.setUserId(rowId);
      Get.to(OtpVerifyScreen(email: emailControllerSignUP.text.trim()));
      return true;
    }
  }

  Future<UserModel?> getUserByEmail(String email) =>
      DbHelper.getUserByEmail(email);

  void getAllUser() async {
    userlist = await DbHelper.getAllUser();
  }

  Future<int> insertUser(UserModel userModel) => DbHelper.insertUser(userModel);

  Future<void> getUserById(int id) async {
    userModel = await DbHelper.getUserById(id);
  }
}
