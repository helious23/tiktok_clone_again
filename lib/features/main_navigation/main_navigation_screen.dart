import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Discover',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Add',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Inbox',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(
          fontSize: Sizes.size48,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: 'Home',
                icon: FontAwesomeIcons.house,
                isSelected: _selectedIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: 'Discover',
                icon: FontAwesomeIcons.magnifyingGlass,
                isSelected: _selectedIndex == 1,
                onTap: () => _onTap(1),
              ),
              // NavTab(
              //   text: 'Add',
              //   icon: FontAwesomeIcons.plus,
              //   isSelected: _selectedIndex == 2,
              //   onTap: () => _onTap(2),
              // ),
              NavTab(
                text: 'Inbox',
                icon: FontAwesomeIcons.message,
                isSelected: _selectedIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: 'Profile',
                icon: FontAwesomeIcons.user,
                isSelected: _selectedIndex == 4,
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
