import 'package:flutter/material.dart';

import '../../../constants.dart';
class PasswordRequirements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "• 8+ characters",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 80),
            Text(
              "• 1 symbol",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "• 1 uppercase",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 80),
            Text(
              "• 1 number",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}