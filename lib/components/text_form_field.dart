import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextInputType? keyboardTpe;
  const CustomTextFormField({Key? key, required this.hint, this.keyboardTpe})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardTpe,
      decoration: InputDecoration(
        hintText: widget.hint,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(0xff0666A7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
