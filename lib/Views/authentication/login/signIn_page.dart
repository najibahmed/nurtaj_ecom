import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurtaj_ecom_home/Views/authentication/Sign%20Up/sign_up_page.dart';

import '../../../custom_widgets/custom_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String routeName = "/signInPage";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailControllerSignIn = TextEditingController();
  TextEditingController passwordControllerSignIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    @override
    void dispose() {
      emailControllerSignIn.dispose();
      passwordControllerSignIn.dispose();
      // TODO: implement dispose
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SvgPicture.asset('assets/images/Vectorscreen_person.svg',
                        //     semanticsLabel: 'A red up arrow', height: 120),

                        ///demo other style
                        CircleAvatar(
                          backgroundColor: theme.primaryColor,
                          radius: 45,
                          child: Icon(
                            CupertinoIcons.person_fill,
                            size: 60,
                            color: theme.scaffoldBackgroundColor,
                          ),
                        ),
                        Text(
                          "Welcome Back!",
                          style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Please login to continue",
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 25),
                        customFormField(
                          'Your Email Address',
                          TextFormField(
                            controller: emailControllerSignIn,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              isDense: true,
                              prefix: Icon(
                                Icons.mail,
                                color: Colors.grey,
                              ),
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
                                controller: passwordControllerSignIn,
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
                                  prefix: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Hint_text@123',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ))),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              "Forgot Password?",
                              style: theme.textTheme.titleMedium!.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                            child: Text("Sign in",style: TextStyle(color: Colors.white),),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Something went wrong. Please try again later.'),
                                  ),
                                );
                              }
                            },
                          ),
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
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Don’t have any account? ',
                                  style: theme.textTheme.titleSmall),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                   Navigator.pushNamed(context, SignUpScreen.routeName);
                                  },
                                text: 'Register Now ',
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ]))
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
