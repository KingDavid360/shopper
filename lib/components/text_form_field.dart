import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType? keyboardTpe;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {Key? key,
      required this.hint,
      this.keyboardTpe,
      required this.textEditingController,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardTpe,
      controller: widget.textEditingController,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Color(0xff0000CD),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
