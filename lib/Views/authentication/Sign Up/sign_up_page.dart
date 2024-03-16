import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Controller/authentication_controller.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Sign%20Up/otp_varification_screen.dart';
import 'package:nurtaj_ecom_home/Views/authentication/login/signIn_page.dart';
import 'package:nurtaj_ecom_home/sevices/cache_storage/local_storage.dart';
import '../../../custom_widgets/custom_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routeName = "/signUpPage";

  @override
  Widget build(BuildContext context) {
    ///dependency
    final authController=Get.put(AuthenticationController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Form(
        key: authController.signUpFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SvgPicture.asset('assets/images/Vectorscreen_person.svg',
                        //     semanticsLabel: 'A red up arrow', height: 100),

                        ///demo other style
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
                        const SizedBox(height: 20),
                        customFormField(
                          'Your Full name',
                          TextFormField(
                            controller: authController.nameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              isDense: true,
                              // prefix: Icon(
                              //   Icons.person,
                              //   color: Colors.grey,
                              // ),
                              hintText: 'Najib Ahmed',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if(value==null ||value.isEmpty){
                                return 'Name Is Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        customFormField(
                          'Your Email Address',
                          TextFormField(
                            controller: authController.emailControllerSignUP,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              isDense: true,
                              // prefix: Icon(
                              //   Icons.mail,
                              //   color: Colors.grey,
                              // ),
                              hintText: 'example@domain.com',
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
                                controller: authController.passwordControllerSignUp,
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
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ))),
                        customFormField(
                            'Confirm Password ',
                            TextFormField(
                                controller: authController.confirmPasswordController,
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
                        SizedBox(height: 30),
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
                                child: Text("Sign up",style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  if (authController.signUpFormKey.currentState!.validate()) {
                                    authController.signUp(context).then((value) {
                                      Get.off(context);
                                    });
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
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
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
                                      Icon(Icons.flutter_dash),
                                      SizedBox(width: 5),
                                      Text('Facebook')
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Already have an account? ',
                                    style: theme.textTheme.titleSmall),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                     Get.to(SignInPage());
                                    },
                                  text: 'Sign in',
                                  style: theme.textTheme.titleMedium!.copyWith(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ])),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
