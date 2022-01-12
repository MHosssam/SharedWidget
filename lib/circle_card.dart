import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widget/text_widget.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxBool>(
      (val) => InkWell(
        onTap: onTap,
        onHover: (value) {
          val.value = value;
        },
        hoverColor: Colors.transparent,
        child: Column(
          children: [
            CircleAvatar(
              minRadius: val.value ? 55 : 40,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(height: 10),
            TextWidget(
              title,
              fontSize: 20,
              fontWeight: val.value ? FontWeight.bold : FontWeight.normal,
            ),
          ],
        ),
      ),
      false.obs,
    );
  }
}
