import 'package:flutter/material.dart';
import '../resources/colors.dart';

TextButton button(
    {required String text,
    required VoidCallback onPressed,
    required Color backgroundColor}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        minimumSize: const Size(100, 35),
        maximumSize: const Size(150, 35),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 10)),
    child: FittedBox(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: colorWhite,
        ),
      ),
    ),
  );
}
