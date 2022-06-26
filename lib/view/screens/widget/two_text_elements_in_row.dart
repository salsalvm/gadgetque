import 'package:flutter/material.dart';
import 'package:gadgetque/view/screens/home/widget/item_text.dart';

class TextElementsInRow extends StatelessWidget {
  const TextElementsInRow({
    Key? key, required this.firstText, required this.secondText, required this.wieght,  required this.fontSize, required this.fontColor,
  }) : super(key: key);
final String firstText;
final String secondText;
final FontWeight wieght;
final double fontSize;
final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        ItemText(
            name: firstText,
            weight: wieght,
            fontSize: fontSize,
            color: fontColor),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          child: ItemText(
              name: secondText,
              weight: wieght,
              fontSize: fontSize,
              color: fontColor),
        ),
      ],
    );
  }
}
