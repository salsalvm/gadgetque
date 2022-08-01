import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/core/color.dart';

class SecondAppbar extends StatelessWidget {
  const SecondAppbar({
    Key? key, required this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: kBlackColor,
      backgroundColor: kBoxColor,
      centerTitle: true,
      title:  Text(
        title,
        style:const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
      ),
    );
  }
}
