import 'package:flutter/material.dart';
import 'package:gadgetque/view/core/radius.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.7,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(margin:const EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: kRAdius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'asset/login_background.png',
                  ),
                  filterQuality: FilterQuality.high,
                ),
              ),
            );
          }),
    );
  }
}
