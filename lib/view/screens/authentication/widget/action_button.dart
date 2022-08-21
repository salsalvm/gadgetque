import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/constant/radius.dart';

class EntryButton extends StatelessWidget {
  const EntryButton({
    Key? key,
    required this.color,
    required this.height,
    required this.onTap,
    required this.buttonName,
    required this.width,
  }) : super(key: key);
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
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
