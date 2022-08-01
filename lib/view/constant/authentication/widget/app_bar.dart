import 'package:flutter/material.dart';

class EntryAppbar extends StatelessWidget {
  const EntryAppbar({
    Key? key,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);
  final Color iconColor;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'asset/logo.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
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
