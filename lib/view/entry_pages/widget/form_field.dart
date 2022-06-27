import 'package:flutter/cupertino.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';

class FormFields extends StatelessWidget {
   FormFields({
    Key? key,
    required this.name, required this.color,
  }) : super(key: key);
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      style:const TextStyle(color: kWhiteColor),
      placeholder: '  $name...',
      placeholderStyle: const TextStyle(
        color: kGreyColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: kRAdius10,
      ),
    );
  }
}
