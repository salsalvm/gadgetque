import 'package:flutter/cupertino.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';

class FormFields extends StatelessWidget {
  const FormFields({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      style: TextStyle(color: kWhiteColor),
      placeholder: '  $name...',
      placeholderStyle: const TextStyle(
        color: kGreyColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: kFormColor,
        borderRadius: kRAdius10,
      ),
    );
  }
}
