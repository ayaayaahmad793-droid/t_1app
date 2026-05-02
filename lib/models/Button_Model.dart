import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  ButtonModel({
    required this.text,
    required this.color,
    required this.onPressed,
  });
}
