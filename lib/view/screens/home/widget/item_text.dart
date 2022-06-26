import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    Key? key,
    required this.name,
    required this.weight,
    required this.fontSize,
    required this.color,
    this.strike
  }) : super(key: key);
  final String name;
  final FontWeight weight;
  final double fontSize;
  final Color color;
  final  strike;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 5),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight,decoration: strike),
      ),
    );
  }
}
