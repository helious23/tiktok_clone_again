import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const NavTab({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.5,
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
