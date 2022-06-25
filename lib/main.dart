import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/entry_pages/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/entry_pages/screen_login/screen_login.dart';
import 'package:gadgetque/view/entry_pages/screen_signup/screen_signup.dart';
import 'view/core/color.dart';

void main() {
  runApp(const GadgetQue());
}

class GadgetQue extends StatelessWidget {
  const GadgetQue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BottomNavigator(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kWhiteColor,
        ),
      ),
    );
  }
}
