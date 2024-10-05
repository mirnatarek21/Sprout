import 'package:flutter/material.dart';
import '../../utils/custom_text_field.dart';

class SignUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SignUpTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
    );
  }
}
