import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  static const int _totalPages = 2;

  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // dx 가 양수라면 오른쪽으로 손가락 스와이프 (화면은 왼쪽으로 전환)
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // dx 가 음수라면 왼쪽으로 손가락 스와이프 (화면은 오른쪽으로 전환)
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      // 스와이프가 끝났을 때 왼쪽으로 손가락 스와이프했다면 두번째 페이지로 전환
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      // 스와이프가 끝났을 때 오른쪽으로 손가락 스와이프했다면 첫번째 페이지로 전환
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Watch cool videos!",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Follow the rules!",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Take a look at the rules and get started!",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),

              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size48,
            horizontal: Sizes.size24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _totalPages; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                        horizontal: Sizes.size4,
                      ),
                      width: _showingPage.index == i
                          ? Sizes.size24
                          : Sizes.size16,
                      height: Sizes.size6,
                      decoration: BoxDecoration(
                        color: _showingPage.index == i
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(
                          Sizes.size3,
                        ),
                      ),
                    ),
                ],
              ),
              Gaps.v20,
              AnimatedOpacity(
                opacity: _showingPage == Page.first ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: CupertinoButton(
                    onPressed: _onEnterAppTap,
                    color: Theme.of(context).primaryColor,
                    disabledColor: Colors.grey.shade300,
                    child: Text(
                      "Enter the app!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
