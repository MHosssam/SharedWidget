import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool center;
  final bool isLoading;
  final bool scaffoldOnLoading;
  final Widget Function(BuildContext context) builder;
  const LoadingWidget({
    Key? key,
    this.center = true,
    required this.isLoading,
    this.scaffoldOnLoading = false,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      Widget res = Padding(
        padding: EdgeInsets.all(8),
        child: LoadingComponent(),
      );

      if (center) {
        res = Center(
          child: res,
        );
      }
      if (scaffoldOnLoading) {
        res = Scaffold(
          body: res,
        );
      }

      return res;
    }
    return builder(context);
  }
}

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
