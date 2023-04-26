import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopper/api/repositories/merchant_repository.dart';
import 'package:shopper/screens/merchant/merchant_home.dart';

import '../../api/repositories/customer_repository.dart';
import '../../components/custom_button.dart';
import '../../components/text_form_field.dart';

class MerchantLogin extends StatefulWidget {
  const MerchantLogin({Key? key}) : super(key: key);

  @override
  State<MerchantLogin> createState() => _MerchantLoginState();
}

class _MerchantLoginState extends State<MerchantLogin> {
  MerchantController merchantController = Get.put(MerchantController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.15),
                Image.asset(
                    height: size.height * 0.1,
                    width: size.width * 0.5,
                    'images/shopper_logo.png'),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Login with email',
                    style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          hint: 'Enter your email',
                          textEditingController: emailController,
                          keyboardTpe: TextInputType.text,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomTextFormField(
                          hint: 'Enter your password',
                          textEditingController: passwordController,
                          keyboardTpe: TextInputType.text,
                          validator: (password) =>
                              password == null || password.isEmpty
                                  ? 'Enter a valid password'
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.04),
                        InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              bool created = await merchantController.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              if (created) {
                                Get.to(() => const MerchantHome());
                              }
                            }
                          },
                          child: CustomButton(text: 'Login'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
