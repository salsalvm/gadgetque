
import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';

class MainHead extends StatelessWidget {
  final String headding;final double top;
  const MainHead({
    Key? key,required this.headding,this.top=30
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top:top,bottom: 10,right: 20,left: 20),
      child: Text(
        headding,
        style:const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
      ),
    );
  }
}
