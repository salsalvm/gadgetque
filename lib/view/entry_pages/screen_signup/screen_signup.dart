import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/widget/action_button.dart';
import 'package:gadgetque/view/entry_pages/widget/app_bar.dart';
import 'package:gadgetque/view/entry_pages/widget/background_image.dart';
import 'package:gadgetque/view/entry_pages/widget/form_field.dart';
import 'package:gadgetque/view/entry_pages/widget/switch_bottom_textbutton.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width * 0.84);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EntryAppbar(),
                  kHeigt80,
                  const Text(
                    'Hey ,\nSign Up Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt100,
                  const FormFields(name: 'Name'),
                  const FormFields(name: 'Mobile'),
                  const FormFields(name: 'Email'),
                  const FormFields(name: 'Password'),
                  const FormFields(name: 'Confirm Password'),
                  kHeigt5,
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ActionButton(
                        color: kFormColor,
                        height: size.width * 0.12,
                        // size: size,
                        onTap: () {},
                        buttonName: 'Submit',
                        width: size.width * 0.836),
                  ),
                  kHeigt80,
                  SwitchBottomTextButton(onTap: () {}, text: 'Log In')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
