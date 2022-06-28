import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';

class FooterCopyrites extends StatelessWidget {
  const FooterCopyrites({
    Key? key,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.width*0.15,
      decoration: const BoxDecoration(
          color: kBlack54Color,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('asset/copyright.png'),
              filterQuality: FilterQuality.high)),
    );
  }
}
