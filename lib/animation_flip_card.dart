import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

//import package page_flip_builder: ^0.1.3
class AnimationFlipCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget frontCard, backCard;
  AnimationFlipCard({
    Key? key,
    this.onTap,
    required this.frontCard,
    required this.backCard,
  }) : super();

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onHover: (ishover) {
        pageFlipKey.currentState?.flip();
      },
      child: PageFlipBuilder(
        interactiveFlipEnabled: true,
        key: pageFlipKey,
        frontBuilder: (_) => frontCard,
        backBuilder: (_) => backCard,
        flipAxis: Axis.horizontal,
        maxTilt: 0.001,
        maxScale: 0.1,
      ),
    );
  }
}
