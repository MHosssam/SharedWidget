import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

///TODO: add package flutter_staggered_animations
class AppSlideAnimation extends StatelessWidget {
  final Widget? child;
  final double? horizontalOffset;
  final double? verticalOffset;
  final Duration? duration;
  const AppSlideAnimation({
    Key? key,
    this.child,
    this.verticalOffset,
    this.horizontalOffset,
    this.duration,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Container(
        child: AnimationConfiguration.synchronized(
          duration: duration ?? Duration(milliseconds: 600),
          child: SlideAnimation(
            verticalOffset: verticalOffset ?? -50,
            horizontalOffset: horizontalOffset ?? 60,
            child: child!,
          ),
        ),
      ),
    );
  }
}
