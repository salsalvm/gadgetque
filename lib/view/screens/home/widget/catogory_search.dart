import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/authentication/splash/splash.dart';
import 'package:gadgetque/view/screens/category/screen_category.dart';
import 'package:get/get.dart';

class CatogorySearch extends StatelessWidget {
  const CatogorySearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.56,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(const ScreenCategory());
              },
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.45,
                    height: size.width * 0.45,
                    decoration: const BoxDecoration(
                      color: kBoxColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'asset/entry_background.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.45,
                    height: size.width * 0.11,
                    decoration: const BoxDecoration(
                      color: kBoxColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'Laptop',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
