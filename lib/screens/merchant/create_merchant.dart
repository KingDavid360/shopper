import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopper/api/repositories/merchant_repository.dart';
import 'package:shopper/screens/merchant/merchant_home.dart';
import 'package:shopper/screens/merchant/merchant_login.dart';

import '../../api/repositories/customer_repository.dart';
import '../../components/custom_button.dart';
import '../../components/text_form_field.dart';
import '../customer/login_screen.dart';

class CreateMerchant extends StatefulWidget {
  const CreateMerchant({Key? key}) : super(key: key);

  @override
  State<CreateMerchant> createState() => _CreateMerchantState();
}

class _CreateMerchantState extends State<CreateMerchant> {
  MerchantController merchantController = Get.put(MerchantController());
  final formKey2 = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
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
                SizedBox(height: size.height * 0.05),
                Image.asset(
                    height: size.height * 0.1,
                    width: size.width * 0.5,
                    'images/shopper_logo.png'),
                SizedBox(height: size.height * 0.015),
                Text(
                  'Welcome to Shopper',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.005),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Become a merchant today with Shopper',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                InkWell(
                  onTap: () {
                    Get.to(() => const MerchantLogin());
                  },
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Color(0xff0000CD),
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.05),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: formKey2,
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
                        SizedBox(height: size.height * 0.02),
                        CustomTextFormField(
                          hint: 'Enter your first name',
                          textEditingController: firstNameController,
                          keyboardTpe: TextInputType.name,
                          validator: (firstName) =>
                              firstName == null || firstName.isEmpty
                                  ? 'Enter a valid name'
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomTextFormField(
                          hint: 'Enter your last name',
                          textEditingController: lastNameController,
                          keyboardTpe: TextInputType.name,
                          validator: (lastName) =>
                              lastName == null || lastName.isEmpty
                                  ? 'Enter a valid name'
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomTextFormField(
                          hint: 'Enter your phone number',
                          textEditingController: phoneNumberController,
                          keyboardTpe: TextInputType.phone,
                          validator: (phoneNumber) =>
                              phoneNumber == null || phoneNumber.isEmpty
                                  ? 'Enter a valid phone number'
                                  : null,
                        ),
                        SizedBox(height: size.height * 0.03),
                        InkWell(
                          onTap: () async {
                            if (formKey2.currentState!.validate()) {
                              bool created = await merchantController.signUp(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                phoneNumber: phoneNumberController.text,
                                password: passwordController.text,
                              );
                              if (created) {
                                Get.to(() => const MerchantHome());
                              }
                            }
                          },
                          child: const CustomButton(
                            text: 'Create account',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
