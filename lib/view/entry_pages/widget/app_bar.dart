import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class EntryAppbar extends StatelessWidget {
  const EntryAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://static.thenounproject.com/png/1279096-200.png',
          color: kGreyColor,
          height: 40,
          width: 40,
        ),
        // Container(
        //   height: 40,
        //   width: 40,
        //   decoration:const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(
        //         'asset/logo.png',
        //       ),
        //     ),
        //   ),
        // ),
        const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            'Gadget Que',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
