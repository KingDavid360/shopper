import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Color(0xff0000CD)),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05),
        ),
      ),
    );
  }
}
