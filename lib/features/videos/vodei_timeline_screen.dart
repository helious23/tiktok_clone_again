import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() =>
      _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  final _scrollDuration = const Duration(milliseconds: 250);
  final _scrollCurve = Curves.linear;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _scrollCurve,
    // );
  }

  Future<void> _onRefresh() async {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 50,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,

        itemBuilder: (context, index) => VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        ),
      ),
    );
  }
}
