import 'package:flutter/material.dart';

void checkPasswordStrength(String password, ValueChanged<int> onStrengthChanged) {
  int steps = 0;
  if (password.length > 8) steps++;
  if (RegExp(r'[A-Z]').hasMatch(password)) steps++;
  if (RegExp(r'[0-9]').hasMatch(password)) steps++;
  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) steps++;

  onStrengthChanged(steps); // Call the callback with the new strength value
}
