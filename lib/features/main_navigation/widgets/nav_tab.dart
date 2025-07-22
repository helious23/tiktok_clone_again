import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final VoidCallback onTap;

  const NavTab({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.icon,
    required this.selectedIcon,
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
                  isSelected ? selectedIcon : icon,
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
