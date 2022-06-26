import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class EntryAppbar extends StatelessWidget {
  const EntryAppbar({
    Key? key, required this.iconColor,required this.textColor,
  }) : super(key: key);
final Color iconColor;final textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.network(
        //   'https://static.thenounproject.com/png/1279096-200.png',
        //   color: iconColor,
        //   height: 40,
        //   width: 40,
        // ),
        Container(
          height: 40,
          width: 40,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'asset/logo.png',
              ),
            ),
          ),
        ),
         Padding(
          padding:const EdgeInsets.only(left: 5.0),
          child: Text(
            'Gadget Que',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
