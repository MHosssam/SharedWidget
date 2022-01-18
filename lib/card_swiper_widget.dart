import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

///TODO: import smooth_page_indicator
class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({
    Key? key,
    required this.images,
    required this.controller,
  }) : super(key: key);

  final List<String> images;
  final PageController controller;
/**
 * PageController(
              viewportFraction: 0.8,
              keepPage: true,
            ),
 */
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            allowImplicitScrolling: true,
            pageSnapping: true,
            controller: controller,
            itemCount: images.length,
            itemBuilder: (_, index) {
              final image = images[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: images.length,
          effect: const JumpingDotEffect(
            dotHeight: 16,
            dotWidth: 16,
            jumpScale: .7,
            verticalOffset: 15,
          ),
        ),
      ],
    );
  }
}
