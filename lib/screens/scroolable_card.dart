import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScrollableCard extends StatefulWidget {
  const ScrollableCard({
    super.key
  });

  @override
  State<ScrollableCard> createState() => _ScrollableCardState();
}

class _ScrollableCardState extends State<ScrollableCard> {
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

  int _currentPageIndex = 0;
  late CarouselController _carouselController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _currentPageIndex = (_currentPageIndex + 1) % sections.length;
      _carouselController.nextPage();
      setState(() {});
    });
  }

  void _stopAutoScroll() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
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
                  child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPageIndex = index % sections.length;
                        });
                      },
                    ),
                    itemCount: sections.length,
                    itemBuilder: (context, index, realIndex) {
                      return buildCard(sections[index]);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: buildBulletPoints(),
                  ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int index = 0; index < sections.length; index++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor:
                  _currentPageIndex == index ? Colors.blue : Colors.grey,
              radius: 8,
            ),
          ),
      ],
    );
  }
}
