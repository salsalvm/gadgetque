import 'package:flutter/material.dart';
import 'package:gadgetque/view/entry_page/entry_screen.dart';

void main() {
  runApp(const GadgetQue());
}

class GadgetQue extends StatelessWidget {
  const GadgetQue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenEntry(),
    );
  }
}
