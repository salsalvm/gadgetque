import 'package:flutter/cupertino.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';

class FormFields extends StatelessWidget {
  FormFields({
    Key? key,
    required this.name,
    required this.color,
    this.size = 18,
    this.inputTextColor,
    this.fontSize,  this.textColor=kGreyColor,
  }) : super(key: key);
  final String name;
  final Color color;
  final Color textColor;
  final double size;
  final double? fontSize;
  final Color? inputTextColor;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      style: TextStyle(color: inputTextColor, fontSize: fontSize),
      placeholder: '  $name',
      placeholderStyle: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: kRAdius10,
      ),
    );
  }
}
