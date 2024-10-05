import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: [
          if (keyboardType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust padding as needed
          suffix: GestureDetector(
            onTap: () {
              controller.clear();
            },
            child: Icon(
              Icons.highlight_remove,
              color: Colors.blueGrey,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey), // Set hint text color
          filled: true,
          fillColor: Colors.white, // Set the fill color to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white, // Customize the border color
              width: 2.0, // Customize the border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white, // Customize the border color for the enabled state
              width: 2.0, // Customize the border width for the enabled state
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white, // Customize the border color for the focused state
              width: 2.0, // Customize the border width for the focused state
            ),
          ),
        ),
      ),
    );
  }
}



