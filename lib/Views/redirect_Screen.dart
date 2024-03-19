import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Controller/authentication_controller.dart';
import 'package:nurtaj_ecom_home/Views/authentication/login/signIn_page.dart';
import 'package:nurtaj_ecom_home/Views/home/dashBoard_page.dart';
import 'package:nurtaj_ecom_home/routes/app_pages.dart';
import 'package:nurtaj_ecom_home/routes/app_routes.dart';
import '../common/const/constants.dart';
import '../sevices/cache_storage/local_storage.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),() async {
       final userMapString =await LocalStorage.getLoginStatus();
      if(userMapString){
        // Get.offAll(()=>const SignInPage(),transition: Transition.rightToLeftWithFade );
        Get.offAllNamed(Routes.signIN,);
      }else{
        // Get.offAll(()=>const DashBoardPage(),transition: Transition.rightToLeftWithFade );
        Get.offAllNamed(Routes.dashBoard,);
      }
    },);
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
      ),
      body: Image.asset(
        appSplashUrl,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    );;
  }
}
