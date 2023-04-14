import 'package:flutter/material.dart';
import 'package:shopper/components/text_form_field.dart';

class CreateCustomerAccount extends StatefulWidget {
  const CreateCustomerAccount({Key? key}) : super(key: key);

  @override
  State<CreateCustomerAccount> createState() => _CreateCustomerAccountState();
}

class _CreateCustomerAccountState extends State<CreateCustomerAccount> {
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
                SizedBox(height: size.height * 0.09),
                Image.asset(
                    height: size.height * 0.1,
                    width: size.width * 0.5,
                    'images/shopper_logo.png'),
                SizedBox(height: size.height * 0.015),
                const Text(
                  'Welcome to Shopper',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),
                const CustomTextFormField(
                  hint: 'Enter your email',
                  keyboardTpe: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  hint: 'Enter your password',
                  keyboardTpe: TextInputType.text,
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  hint: 'Enter your first name',
                  keyboardTpe: TextInputType.text,
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  hint: 'Enter your last name',
                  keyboardTpe: TextInputType.text,
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  hint: 'Enter your phone number',
                  keyboardTpe: TextInputType.text,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
