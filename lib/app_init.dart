import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/init_bindings.dart';

import 'package:nurtaj_ecom_home/common/const/color.dart';
import 'package:nurtaj_ecom_home/routes/app_pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.myBlue),
        useMaterial3: true,
      ),
      initialRoute: AppPages.INITIAL,
      // home: const RedirectScreen(),
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
    );
  }
}