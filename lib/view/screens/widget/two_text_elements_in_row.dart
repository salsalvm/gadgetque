import 'package:flutter/material.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';

class TextElementsInRow extends StatelessWidget {
  const TextElementsInRow({
    Key? key,
    this.paddding = 15,
    required this.firstText,
    required this.secondText,
    required this.wieght,
    required this.fontSize,
    required this.fontColor,
    this.onTap,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final FontWeight wieght;
  final double fontSize;
  final Color fontColor;
  final double paddding;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemText(
            name: firstText,
            weight: wieght,
            fontSize: fontSize,
            color: fontColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddding),
          child: ItemText(
              onTap: onTap,
              name: secondText,
              weight: wieght,
              fontSize: fontSize,
              color: fontColor),
        ),
      ],
    );
  }
}
