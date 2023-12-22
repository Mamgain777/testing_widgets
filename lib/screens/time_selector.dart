 import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Time Selector"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Card(
            elevation: 3,
            child: SizedBox(
              height: 300,
              child: Row(
                children: [
                  
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}