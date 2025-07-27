import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Discover'),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w700,
            ),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.grey.shade300,
            splashFactory: NoSplash.splashFactory,

            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.all(Sizes.size10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/placeholder.jpeg",
                      image:
                          "https://picsum.photos/id/${index + 10}/900/1600",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "This is a very long caption for my tiktok video that i'm going to use to test the layout of the video caption",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gaps.v8,
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: Sizes.size12,
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/id/${index + 10}/200/200",
                          ),
                        ),
                        Gaps.h5,
                        Expanded(
                          child: Text(
                            "My avatar is going to be very long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade700,
                        ),
                        Gaps.h4,
                        Text("1.2M"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
