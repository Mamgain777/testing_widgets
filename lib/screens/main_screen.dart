import 'package:flutter/material.dart';
import 'package:testing_widgets/screens/depth_card.dart';
import 'package:testing_widgets/screens/scroolable_card.dart';
import 'package:testing_widgets/screens/scroolable_table.dart';

class MainScreen extends StatefulWidget {

  final String title;
  const MainScreen({
    required this.title,
    super.key
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScroolableTable(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Scroolable Table"
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScrollableCard(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Scroolable Card"
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DepthCard(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    "Depth Card"
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