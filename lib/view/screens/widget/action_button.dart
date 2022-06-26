import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class ActionButtonClient extends StatelessWidget {
  const ActionButtonClient({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final onTap;
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      onPressed: onTap,
      color: kButtonColor,
      minWidth: buttonWidth,
      height: buttonHeight,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
