import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';

class MainHead extends StatelessWidget {
  final String headding;
  final double top;
  const MainHead(
      {Key? key,
      required this.headding,
      this.top = 30,
      this.color = kBlackColor})
      : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 10, right: 20, left: 20),
      child: Text(
        headding,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
