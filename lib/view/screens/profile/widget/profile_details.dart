import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.56,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: kRAdius10,
        color: kBoxColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextElementsInRow(
                onTap: () {},
                paddding: 5,
                firstText: 'Profile',
                secondText: 'Edit',
                wieght: FontWeight.bold,
                fontSize: 20,
                fontColor: kBlackColor),
            const DivLine(),
            Padding(
              padding: const EdgeInsets.only(top:8),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: kGreenColor,
                  radius: 45,
                  child: const Text('no image'),
                ),
              ),
            ),
            kHeigt5,
            const TextElementsInRow(
                firstText: 'NAME   :',
                secondText: "SALSAL VM",
                wieght: FontWeight.w600,
                fontSize: 20,
                fontColor: kBlackColor),
            kHeigt10,
            const TextElementsInRow(
                firstText: 'MAIL     :',
                secondText: "abc@gmail.com",
                wieght: FontWeight.w600,
                fontSize: 18,
                fontColor: kBlack54Color)
          ],
        ),
      ),
    );
  }
}
