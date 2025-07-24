import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePresed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text("22,796 comments"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _onClosePresed,
              icon: FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size10,
                horizontal: Sizes.size16,
              ),
              separatorBuilder: (context, index) => Gaps.v20,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: Sizes.size16,
                    backgroundImage: NetworkImage(
                      "https://picsum.photos/200/300",
                    ),
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Max",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Gaps.v3,
                        Text(
                          "윤서야 장기자랑 너무 잘하는데! 메달리기도 잘하고 파이어폴도 정말 멋져 ㅎㅎ 다음에 또 보여줘 💖",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.h10,
                  Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                      Gaps.v5,
                      Text(
                        "52.2K",
                        style: TextStyle(
                          fontSize: Sizes.size12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              // bottonAppBar 에서 키보드 사용 시 bottomAppBar 사라짐
              // body 에 stock > positioned 사용
              // positioned 사용 시, 기기의 width 필요하여 MediaQuery 사용
              width: size.width,
              child: BottomAppBar(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size10,
                ),
                color: Colors.white,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: Sizes.size16,
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.grey.shade500,
                      child: Text(
                        "Max",
                        style: TextStyle(
                          fontSize: Sizes.size12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Add a comment",
                          hintStyle: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade500,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              Sizes.size12,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                            horizontal: Sizes.size10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
