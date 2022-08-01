import 'package:flutter/cupertino.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';

class FormFields extends StatelessWidget {
 const FormFields({
    Key? key,
    required this.name,
    required this.icon,
    required this.color,
    this.size = 18,
    this.inputTextColor,
    this.fontSize,
    this.textColor = kGreyColor,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);
  final String name;
  final Color color;
  final Color textColor;
  final double size;
  final double? fontSize;
  final Color? inputTextColor;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final validator;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
      child: CupertinoTextField(
        controller: controller,
        onChanged: validator,
        obscuringCharacter: '*',
        decoration: BoxDecoration(
          color: color,
          borderRadius: kRAdius10,
        ),
        style: TextStyle(
          fontSize: fontSize,
          color: inputTextColor,
        ),
        placeholder: name,
        obscureText: obscureText,
        placeholderStyle: TextStyle(
            color: textColor, fontWeight: FontWeight.w400, fontSize: size),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        prefix: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: kGreyColor,
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
