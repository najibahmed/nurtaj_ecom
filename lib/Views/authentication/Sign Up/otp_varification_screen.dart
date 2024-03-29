
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurtaj_ecom_home/Views/home/dashBoard_page.dart';
import 'package:pinput/pinput.dart';

import '../login/signIn_page.dart';

class OtpVerifyScreen extends StatefulWidget {
  static const String routeName='/OtpVerification';
  final String email;
  const OtpVerifyScreen({super.key, required this.email});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  bool showButton = false;
  final controller = TextEditingController();
  // final authController=Get.put(AuthenticationController());
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 5;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(251, 0, 44, 1.0);
    const fillColor = Colors.white;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    final theme = Theme.of(context);
    final key = GlobalKey();
    return Scaffold(
      key: key,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 25,
            )),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Color(0xFF0D47A1).withOpacity(.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.3, 1])),
          ),
          ListView(
            children: [
              OtpHeader(email: widget.email),
              SizedBox(
                child: Pinput(
                  forceErrorState: showError,
                  length: length,
                  controller: controller,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    setState(() {
                      showButton = !showButton;
                    });
                    // if(authController.OTP==pin){
                    //   authController.checkOTPCreateAccount(context, pin);

                    // }else{
                    //   setState(() {
                    //     showError=true;
                    //   });
                    // }
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  Text(
                    "Didn't receive code?",
                    style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text(
                      "Resend",
                      style: theme.textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: showButton
                    ? SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      // if(authController.OTP==controller.text.trim()){
                      //   authController.checkOTPCreateAccount(context, controller.text.trim());
                      // }else{
                      //   setState(() {
                      //     showError=true;
                      //   });
                      // }
                      Get.offAll(const SignInPage(),transition: Transition.rightToLeftWithFade );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(55)),
                    child: const Text(
                      "Verify",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                )
                    : SizedBox(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class OtpHeader extends StatelessWidget {
  final String email;
  const OtpHeader({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 100),
          // BounceInLeft(
          //   delay: const Duration(milliseconds: 200),
          //   child: Text(
          //     "Hello There",
          //     style:theme.textTheme.titleLarge!
          //         .copyWith(color: theme.primaryColor),
          //   ),
          // ),
          // BounceInLeft(
          //   delay: const Duration(milliseconds: 400),
          //   child: Text(
          //     'Welcome Back!',
          //     style: theme.textTheme.titleLarge!.copyWith(
          //         color: theme.primaryColor,
          //         fontWeight: FontWeight.normal),
          //   ),
          // ),
          // const SizedBox(height: 40),
          BounceInLeft(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Code Verification',
              style:
              theme.textTheme.titleLarge!.copyWith(color: Colors.black54),
            ),
          ),
          BounceInLeft(
            delay: const Duration(milliseconds: 600),
            child: Text(
              "Please Provide Enter the code sent to the email address",
              style: theme.textTheme.titleSmall!.copyWith(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Text(
            '$email',
            style: theme.textTheme.titleSmall!
                .copyWith(color: Colors.black54, fontSize: 20),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
