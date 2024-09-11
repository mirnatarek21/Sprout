import 'package:flutter/material.dart';

Widget buildSettingsItem(String title, String iconAsset, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0.5),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0, // Remove shadow effect
      child: ListTile(
        leading: Image.asset(
          iconAsset,
          width: 24,
          height: 24,
        ),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: onTap, // Handle item tap
      ),
    ),
  );
}
