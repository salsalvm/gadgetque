import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/core/color.dart';

class SwitchBottomTextButton extends StatelessWidget {
  const SwitchBottomTextButton({
    required this.onTap,required this.text,
    Key? key,
  }) : super(key: key);
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'not a member ? ',
          style: TextStyle(fontSize: 16, color: kWhiteColor),
        ),
        TextButton(
          onPressed: onTap,
          child:  Padding(
            padding: const EdgeInsets.only(bottom:4.0),
            child: Text(
              text,
              style:const TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
              ),
            ),
          ),  
        )
      ],
    );
  }
}