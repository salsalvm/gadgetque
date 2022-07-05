import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';

class EntryButton extends StatelessWidget {
  const EntryButton({
    Key? key,
    required this.color,
    required this.height,
    // required this.size,
    required this.onTap,
    required this.buttonName,
    required this.width,
  }) : super(key: key);
  final onTap;
  final height;
  final width;
  // final Size size;
  final color;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: kRAdius10,
      ),
      height: height,
      minWidth: width,
      color: color,
      onPressed: onTap,
      child: Text(
        buttonName,
        style: const TextStyle(color: kWhiteColor, fontSize: 20),
      ),
    );
  }
}
