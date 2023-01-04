// import 'package:flutter/material.dart';
// import 'package:login_signup/components/common/custom_input_field.dart';
// import 'package:login_signup/components/common/page_header.dart';
// import 'package:login_signup/components/forget_password_page.dart';
// import 'package:login_signup/components/signup_page.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:login_signup/components/common/page_heading.dart';

// import 'package:login_signup/components/common/custom_form_button.dart';

import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_register_demo/SignIn.dart';
import 'package:login_register_demo/components/HomeScreen.dart';
import 'package:login_register_demo/components/common/custom_form_button.dart';
import 'package:login_register_demo/components/common/custom_input_field.dart';
import 'package:login_register_demo/components/common/page_header.dart';
import 'package:login_register_demo/components/common/page_heading.dart';
import 'package:login_register_demo/components/forget_password_page.dart';
import 'package:login_register_demo/components/signup_page.dart';

// const users = const {
//   'admin': 'admin',
// };

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  //final _emailTextContoller = TextEditingController();
  //final _passwordTextContoller = TextEditingController();
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _passwordTextContoller = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

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

      //log("Emailvalidator----++++$_emailTextContoller");
    //   if (_emailTextContoller.text == "admin@gmail.com" &&
    //       _passwordTextContoller.text == "admin") {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Submitting data..')),
    //     );
    //     // ss();
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
    //   }
    //   //return null;
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('enter valid userId and Pass data..')),
    //   );
    //  // return null;
    // }
    //return null;
  }
    if (_emailTextContoller.text == "admin@gmail.com" &&
          _passwordTextContoller.text == "admin") {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Submitting data..')),
        // );
        // ss();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
      //return null;
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('enter valid userId and Pass data..')),
      );
     // return null;
    }

  //return null;
}
}


// void ss() {
//    Navigator.push(
//                     context, MaterialPageRoute(builder: (_) => HomeScreen()));
// }






// String ss() {

//     if (_emailTextContoller == "admin") {
//       return "";
//     }else{
//       return "invalida admin";
//     }
//     if (_passwordTextContoller =="admin") {
//       return "";
//         }else{
//       return "invalidare admin";

//     }

//      ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Submitting data..')),
//       );
//     return "sucesess";
//   }




