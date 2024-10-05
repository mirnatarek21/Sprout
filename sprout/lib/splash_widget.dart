import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';

Widget buildSplashWidget(BuildContext context) {
  return Container(
    color: backgroundColor,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/Frame.png'),
      ],
    ),
  );
}
