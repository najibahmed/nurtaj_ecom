import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Sign%20Up/sign_up_page.dart';
import 'package:nurtaj_ecom_home/common/tools/dialog.dart';
import 'package:nurtaj_ecom_home/sevices/cache_storage/local_storage.dart';
import '../../../custom_widgets/custom_form_field.dart';
import '../../home/dashBoard_page.dart';
import '../Controller/authentication_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String routeName = "/signInPage";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authController = Get.put(AuthenticationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Form(
        key: authController.signInformKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 45,
                  child: Icon(
                    CupertinoIcons.person_fill,
                    size: 50,
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
                Center(
                  child: Text(
                    "Welcome Back!",
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Please login to continue",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 25),
                customFormField(
                  'Your Email Address',
                  TextFormField(
                    controller: authController.emailControllerSignIn,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      isDense: true,
                      // prefix: Icon(
                      //   Icons.mail,
                      //   color: Colors.grey,
                      // ),
                      labelText: 'Email Address',
                      hintText: 'abc@gmail.com',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        return 'Input Valid Email Address';
                      }
                      return null;
                    },
                  ),
                ),
                customFormField(
                    'Password ',
                    TextFormField(
                        controller: authController.passwordControllerSignIn,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Input Valid Password With 6 Digit';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: '•',
                        decoration: InputDecoration(
                          isDense: true,
                          // prefix: Icon(
                          //   Icons.lock,
                          //   color: Colors.grey,
                          // ),
                          hintText: 'Hint_text@123',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ))),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async{
                          if (authController.signInformKey.currentState!.validate())  {
                            String? userMapString= await LocalStorage.getUser(authController.emailControllerSignUP.text.toString());
                            if(userMapString==null || userMapString.isEmpty){
                              authenticationErrorDialog("Error Login", "User Not Found");
                            }else{
                              Get.offAll(DashBoardPage(),transition: Transition.rightToLeftWithFade  );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .8,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("OR CONTINUE WITH"),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: .8,
                    )),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // SvgPicture.asset(icon,height: 30,
                              //     semanticsLabel: 'A red up arrow'),
                              Icon(Icons.flutter_dash),
                              SizedBox(width: 5),

                              Text('Google')
                            ],
                          )),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // SvgPicture.asset(faceBookIcon,height: 30,
                              //     semanticsLabel: 'A red up arrow'),
                              Icon(Icons.flutter_dash),
                              SizedBox(width: 5),
                              Text('Facebook')
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Don’t have any account? ',
                        style: theme.textTheme.titleSmall),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(SignUpScreen());
                        },
                      text: 'Register Now ',
                      style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ])),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
