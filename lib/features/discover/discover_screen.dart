import 'package:flutter/cupertino.dart';
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

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  final TextEditingController _textController =
      TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      // 탭이 변경될 때 키보드를 dismiss
      FocusScope.of(context).unfocus();
    });
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // void _onSearchChanged(String value) {
  //   print(value);
  // }

  // void _onSearchSubmitted(String value) {
  //   print(value);
  // }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextField(
            controller: _textController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(Sizes.size12),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.size10,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: Sizes.size10),
                child: SizedBox(
                  width: Sizes.size20,
                  height: Sizes.size20,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: Sizes.size20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
              suffixIcon: _textController.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: Sizes.size10,
                      ),
                      child: GestureDetector(
                        onTap: _onClearTap,
                        child: SizedBox(
                          width: Sizes.size20,
                          height: Sizes.size20,
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              size: Sizes.size20,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
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
        body: GestureDetector(
          onTap: _stopWriting,
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: EdgeInsets.all(Sizes.size10),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Sizes.size10,
                      mainAxisSpacing: Sizes.size10,
                      childAspectRatio: 9 / 20,
                    ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              "assets/images/placeholder.jpeg",
                          image:
                              "https://picsum.photos/id/${index + 10}/900/1600",
                          fit: BoxFit.cover,
                        ),
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
      ),
    );
  }
}
