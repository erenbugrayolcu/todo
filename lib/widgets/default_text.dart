import 'package:flutter/material.dart';
import 'package:NOT/widgets/themes.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextDecoration decoration;

  const DefaultText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColors.textColor,
    required this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        decoration: decoration,
      ),
    );
  }
}
