import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const VideoButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FaIcon(icon, color: Colors.white, size: Sizes.size40),
        Gaps.v5,
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
