import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_register_demo/SignIn.dart';
import 'package:login_register_demo/components/HomeScreen.dart';
import 'package:login_register_demo/components/common/custom_form_button.dart';
import 'package:login_register_demo/components/common/custom_input_field.dart';
import 'package:login_register_demo/components/common/loading_dialog.dart';
import 'package:login_register_demo/components/common/page_header.dart';
import 'package:login_register_demo/components/common/page_heading.dart';
import 'package:login_register_demo/components/forget_password_page.dart';
import 'package:login_register_demo/components/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _passwordTextContoller = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailTextContoller.dispose();
    _passwordTextContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Log-in',
                        ),
                        Container(
                            width: size.width * 0.80,
                            child: (TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                              ),
                              controller: _emailTextContoller,
                              validator: (_emailTextContoller) {
                                if (_emailTextContoller == null ||
                                    _emailTextContoller.isEmpty) {
                                  return 'Email is required!';
                                }
                                if (!EmailValidator.validate(
                                    _emailTextContoller)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ))),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                            width: size.width * 0.80,
                            child: (TextFormField(
                              decoration: InputDecoration(
                                labelText: "Password",
                              ),
                              obscureText: true,
                              controller: _passwordTextContoller,
                              validator: (_passwordTextContoller) {
                                if (_passwordTextContoller == null ||
                                    _passwordTextContoller.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ))),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: size.width * 0.80,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordPage()))
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                color: Color(0xff939393),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          innerText: 'Login',
                          onPressed: _handleLoginUser,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account ? ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff939393),
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()))
                                },
                                child: const Text(
                                  'Sign-up',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff748288),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      print("Emailvalidator----++++$_emailTextContoller");
      print("Passvalidator----++++$_passwordTextContoller");
    }
    login();
  }

  void login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    // showLoaderDialog(context);
    Dialogs.showLoadingDialog(context);
    final String email = _emailTextContoller.text;
    final String password = _passwordTextContoller.text;
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      await db.collection("Users").doc(userCredential.user!.uid).get();

      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('No User Found for that Email')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Account Already exists')),
        );
      }
    }
  }
}
