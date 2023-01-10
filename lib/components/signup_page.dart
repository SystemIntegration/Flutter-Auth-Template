// import 'dart:io';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:login_signup/components/common/page_header.dart';
// import 'package:login_signup/components/common/page_heading.dart';
// import 'package:login_signup/components/login_page.dart';

// import 'package:login_signup/components/common/custom_form_button.dart';
// import 'package:login_signup/components/common/custom_input_field.dart';

import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_register_demo/components/common/custom_form_button.dart';
import 'package:login_register_demo/components/common/custom_input_field.dart';
import 'package:login_register_demo/components/common/page_header.dart';
import 'package:login_register_demo/components/common/page_heading.dart';
import 'package:login_register_demo/components/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameTextContoller = TextEditingController();
  final TextEditingController _emailTextContoller = TextEditingController();
  final TextEditingController _passwordTextContoller = TextEditingController();

  File? _profileImage;

  final _signupFormKey = GlobalKey<FormState>();

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                // const PageHeader(),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(
                        title: 'Sign-up',
                      ),
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: _pickProfileImage,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // CustomInputField(
                      //     labelText: 'Name',
                      //     hintText: 'Your name',
                      //     isDense: true,
                      //     validator: (textValue) {
                      //       if (textValue == null || textValue.isEmpty) {
                      //         return 'Name field is required!';
                      //       }
                      //       return null;
                      //     }),

                      Container(
                          width: size.width * 0.80,
                          child: (TextFormField(
                            decoration: InputDecoration(
                              labelText: "Name",
                            ),
                            controller: _nameTextContoller,
                            validator: (_nameTextContoller) {
                              if (_nameTextContoller == null ||
                                  _nameTextContoller.isEmpty) {
                                return 'name is required!';
                              }
                              
                              return null;
                            },
                          ))),
                      const SizedBox(
                        height: 16,
                      ),
                      // CustomInputField(
                      //     labelText: 'Email',
                      //     hintText: 'Your email id',
                      //     isDense: true,
                      //     validator: (textValue) {
                      //       if (textValue == null || textValue.isEmpty) {
                      //         return 'Email is required!';
                      //       }
                      //       if (!EmailValidator.validate(textValue)) {
                      //         return 'Please enter a valid email';
                      //       }
                      //       return null;
                      //     }),

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
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // CustomInputField(
                      //     labelText: 'Contact no.',
                      //     hintText: 'Your contact number',
                      //     isDense: true,
                      //     validator: (textValue) {
                      //       if (textValue == null || textValue.isEmpty) {
                      //         return 'Contact number is required!';
                      //       }
                      //       return null;
                      //     }),
                      const SizedBox(
                        height: 16,
                      ),
                      // CustomInputField(
                      //   labelText: 'Password',
                      //   hintText: 'Your password',
                      //   isDense: true,
                      //   obscureText: true,
                      //   validator: (textValue) {
                      //     if (textValue == null || textValue.isEmpty) {
                      //       return 'Password is required!';
                      //     }
                      //     return null;
                      //   },
                      //   suffixIcon: true,
                      // ),

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
                        height: 22,
                      ),
                      // CustomFormButton(
                      //   innerText: 'Signup',
                      //   onPressed: _handleSignupUser,
                      // ),
                      CustomFormButton(
                        innerText: 'Signup',
                        onPressed: _handleSignupUser,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ? ',
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
                                            const LoginPage()))
                              },
                              child: const Text(
                                'Log-in',
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
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignupUser() {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }
  }
}
