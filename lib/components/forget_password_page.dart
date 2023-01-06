// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:login_signup/components/common/custom_form_button.dart';
// import 'package:login_signup/components/common/page_header.dart';
// import 'package:login_signup/components/common/page_heading.dart';
// import 'package:login_signup/components/login_page.dart';
// import 'package:login_signup/components/common/custom_input_field.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_register_demo/components/common/custom_form_button.dart';
import 'package:login_register_demo/components/common/custom_input_field.dart';
import 'package:login_register_demo/components/common/page_header.dart';
import 'package:login_register_demo/components/common/page_heading.dart';
import 'package:login_register_demo/components/login_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _forgetPasswordFormKey = GlobalKey<FormState>();
  final emailTextFieldController = TextEditingController();

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
                    key: _forgetPasswordFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Forgot password',
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
                        //                 print('Emailvalue--------++++${textValue}');

                        //       return null;
                        //     }
                        //     ),
                       
                          Container(
                            width: size.width * 0.85,
                            child:  TextFormField(
                          
                          controller: emailTextFieldController,
                          style: const TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            //border: OutlineInputBorder(),
                            labelText: "Email",
                           // prefixIcon: Icon(Icons.email),
                            hintText: "Enter your email ID",
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }

                            if (!EmailValidator.validate(text)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          innerText: 'Submit',
                          onPressed: _handleForgetPassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()))
                            },
                            child: const Text(
                              'Back to login',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff939393),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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

  void _handleForgetPassword() {
    // forget password
    if (_forgetPasswordFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }

    print('Second text field: ${emailTextFieldController.text}');
  }
}
