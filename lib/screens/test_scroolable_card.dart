import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class TestScrollableCard extends StatefulWidget {
  const TestScrollableCard({
    super.key,
  });

  @override
  State<TestScrollableCard> createState() => _TestScrollableCardState();
}

class _TestScrollableCardState extends State<TestScrollableCard> {
  List sections = [
    [
      'Card 1 Content',
      'Card 1 Content',
      'Card 1 Content',
    ],
    [
      'Card 2 Content',
      'Card 2 Content',
      'Card 2 Content',
    ],
    [
      'Card 3 Content',
      'Card 3 Content',
      'Card 3 Content',
    ],
  ];

  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex =
            (_pageController.page!.round() + 2) % sections.length;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Scrollable Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Card(
          child: SizedBox(
            height: 400,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: sections.length + 2,
                    itemBuilder: (context, index) {
                      return buildCard(sections[index % sections.length]);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: buildBulletPoints(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(List<String> content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content[0],
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          content[1],
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          content[2],
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget buildBulletPoints() {
    return ListView.builder(
      itemCount: sections.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor:
                _currentPageIndex == index ? Colors.blue : Colors.grey,
            radius: 8,
          ),
        );
      },
    );
  }
}
