import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

///TODO: import card_swiper
class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemCount: images.length,
        autoplay: true,
        loop: true,
        viewportFraction: 0.8,
        scale: 0.8,
        itemBuilder: (context, index) {
          final image = images[index];
          return Container(
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
    );
  }
}
