import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class ScrollableCard extends StatefulWidget {
  const ScrollableCard({
    super.key
  });

  @override
  State<ScrollableCard> createState() => _ScrollableCardState();
}

class _ScrollableCardState extends State<ScrollableCard> {
  final List<String> section1 = [
    'Card 1 Content',
    'Card 1 Content',
    'Card 1 Content'
  ];
  final List<String> section2 = [
    'Card 2 Content',
    'Card 2 Content',
    'Card 2 Content'
  ];
  final List<String> section3 = [
    'Card 3 Content',
    'Card 3 Content',
    'Card 3 Content'
  ];

  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
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
                  child: PageView(
                    controller: _pageController,
                    children: [
                      buildCard(section1),
                      buildCard(section2),
                      buildCard(section3),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: 
                  buildBulletPoints(),
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
      itemCount: 3,
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
