import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get/route_manager.dart';

class ItemText extends StatelessWidget {
  const ItemText(
      {Key? key,
      required this.name,
      required this.weight,
      required this.fontSize,
      required this.color,
      this.strike,this.lines=1,
      this.onTap,
      this.spacing})
      : super(key: key);
  final String name;
  final FontWeight weight;
  final double fontSize;
  final color;
  final onTap;
  final spacing;
  final lines;
  final TextDecoration? strike;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,maxLines: lines,
          style: TextStyle(
              letterSpacing: spacing,
              color: color,
              fontSize: fontSize,
              fontWeight: weight,
              decoration: strike),
        ),
      ),
    );
  }
}
