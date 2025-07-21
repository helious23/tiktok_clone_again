import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        backgroundColor: Colors.white,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        iconSize: 24,
        height: 50,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.search,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.add,
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: _selectedIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) => screens[index],
    );
  }
}
