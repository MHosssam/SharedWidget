import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//import lottie pacage
class AppLoading extends StatelessWidget {
  final double? width, height;

  const AppLoading({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height ?? 140,
        width: width ?? 140,
        child: Lottie.asset(
          'assets/lottie/loading.json',
        ),
      ),
    );
  }
}
