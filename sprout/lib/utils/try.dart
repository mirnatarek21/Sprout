import 'package:flutter/material.dart';

class PasswordCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordCustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _PasswordCustomTextFieldState createState() => _PasswordCustomTextFieldState();
}

class _PasswordCustomTextFieldState extends State<PasswordCustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust padding as needed
              hintText: widget.hintText,
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
          GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
