import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isDate;
  final bool isDropdown;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSuffixIconTap;
  final List<String>? dropdownItems;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.isDate = false,
    this.isDropdown = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSuffixIconTap,
    this.dropdownItems,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: blueshade,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: blueshade,
            width: 2.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: blueshade,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.isDate
                ? IconButton(
                    icon: const Icon(Icons.calendar_today, color: blueshade),
                    onPressed: widget.onSuffixIconTap,
                  )
                : widget.isDropdown
                    ? PopupMenuButton<String>(
                        icon:
                            const Icon(Icons.arrow_drop_down, color: blueshade),
                        onSelected: (value) {
                          widget.controller.text = value;
                        },
                        itemBuilder: (context) => widget.dropdownItems!
                            .map((item) => PopupMenuItem(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                      )
                    : null,
      ),
    );
  }
}
