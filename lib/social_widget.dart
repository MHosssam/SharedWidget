import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    Key? key,
    required this.imageUrl,
    required this.socialUrl,
  }) : super(key: key);

  final String imageUrl;
  final String socialUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset(
        imageUrl,
        height: 40,
        width: 40,
      ),
      onTap: () async {
        await launch(socialUrl);
      },
    );
  }
}
