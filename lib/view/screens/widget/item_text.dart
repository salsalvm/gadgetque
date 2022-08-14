import 'package:flutter/material.dart';

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
  final Color? color;
  final void Function()? onTap;
  final double? spacing;
  final int lines;
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
