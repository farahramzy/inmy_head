import 'package:flutter/material.dart';

Widget buildMenuItem({
  required String text,
  required IconData icon,
  required Color iconColor,
  VoidCallback? onClicked,
}) {
  const color = Colors.white;

  return ListTile(
    leading: Icon(icon, color: iconColor),
    title: Text(text, style: const TextStyle(color: color)),
    onTap: onClicked,
  );
}
