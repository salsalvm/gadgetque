import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class FooterCopyrites extends StatelessWidget {
  const FooterCopyrites({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 60,
      decoration: const BoxDecoration(
          color: kBlack54Color,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('asset/copyright.png'),
              filterQuality: FilterQuality.high)),
    );
  }
}
