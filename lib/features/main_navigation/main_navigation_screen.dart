import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> screens = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Add')),
    const Center(child: Text('Likes')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        labelBehavior:
            NavigationDestinationLabelBehavior.onlyShowSelected,

        destinations: [
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.house,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.plus,
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Likes',
          ),
        ],
      ),
    );
  }
}
