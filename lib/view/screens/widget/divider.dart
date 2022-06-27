
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class DivLine extends StatelessWidget {
  const DivLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5),
      child: const Divider(
        height: 3,thickness: 1,
        color: kGreyColor,
      ),
    );
  }
}