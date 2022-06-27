import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.text,
    required this.onTap,
    this.fontSize = 24,  this.buttonColor=kButtonColor, this.radius=10,
  }) : super(key: key);
  final onTap;
  final String text;final double radius;
  final double buttonHeight;
  final double buttonWidth;
  final double fontSize;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      onPressed: onTap,
      color: buttonColor,
      minWidth: buttonWidth,
      height: buttonHeight,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
