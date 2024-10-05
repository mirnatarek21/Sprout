import 'package:flutter/material.dart';

class PasswordCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;

  const PasswordCustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
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
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        style: TextStyle(
          letterSpacing: obscureText ? 2.0 : 1.0, // Adjust letter spacing when obscured
        ),
        textAlign: TextAlign.center, // Center the text
        onChanged: widget.onChanged, // Call the onChanged callback
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust padding as needed
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.blueGrey,
            ),
          ),
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
        // Custom obscuring character
        obscuringCharacter: '*', // Use '*' instead of the default '•'
      ),
    );
  }
}

class SimplePasswordCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const SimplePasswordCustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _SimplePasswordCustomTextFieldState createState() => _SimplePasswordCustomTextFieldState();
}

class _SimplePasswordCustomTextFieldState extends State<SimplePasswordCustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        style: TextStyle(
          letterSpacing: obscureText ? 2.0 : 1.0, // Adjust letter spacing when obscured
        ),
        textAlign: TextAlign.center, // Center the text
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust padding as needed
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.blueGrey,
            ),
          ),
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
        // Custom obscuring character
        obscuringCharacter: '*', // Use '*' instead of the default '•'
      ),
    );
  }
}



