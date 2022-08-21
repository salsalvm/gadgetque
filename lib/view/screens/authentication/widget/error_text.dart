import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';

class ErrorText extends StatelessWidget {
  ErrorText({
    Key? key,
    required this.errorText,
    this.isVisible = false,
  }) : super(key: key);
  final bool isVisible;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Visibility(
        visible: isVisible,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            errorText,
            style: const TextStyle(
                fontSize: 15, color: kredColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
