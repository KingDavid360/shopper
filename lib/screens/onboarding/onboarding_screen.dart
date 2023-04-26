import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/components/custom_button.dart';
import 'package:shopper/screens/customer/create_customer.dart';
import 'package:shopper/screens/merchant/create_merchant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
                SizedBox(height: size.height * 0.12),
                Image.asset(
                    height: size.height * 0.1,
                    width: size.width * 0.5,
                    'images/shopper_logo.png'),
                SizedBox(height: size.height * 0.015),
                Text(
                  'Shopper',
                  style: TextStyle(
                    fontSize: size.width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Register as a merchant or customer',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: InkWell(
                            onTap: () {
                              Get.to(() => const CreateMerchant());
                            },
                            child: CustomButton(text: 'Merchant'))),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Flexible(
                        child: InkWell(
                            onTap: () {
                              Get.to(() => const CreateCustomerAccount());
                            },
                            child: const CustomButton(text: 'Customer'))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
