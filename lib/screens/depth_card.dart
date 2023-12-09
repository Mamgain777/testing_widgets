import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class DepthCard extends StatefulWidget {
  const DepthCard({super.key});

  @override
  State<DepthCard> createState() => _DepthCardState();
}

class _DepthCardState extends State<DepthCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CommonAppbar(appbarTitle: "Depth Card"),
      ),
      body: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade200,
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Content with Depth',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}