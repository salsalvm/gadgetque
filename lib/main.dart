import 'package:flutter/material.dart';
import 'package:gadgetque/view/constant/color.dart';
import 'package:gadgetque/view/screens/authentication/splash/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const GadgetsQue(),
  );
}

class GadgetsQue extends StatelessWidget {
  const GadgetsQue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenEntry(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kWhiteColor,
        ),
      ),
    );
  }
}
