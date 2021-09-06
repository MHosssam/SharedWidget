import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140,
        width: 140,

        ///TODO: import lottie pacage
        child: Lottie.asset(
          'assets/lottie/loading.json',
        ),
      ),
    );
  }
}
