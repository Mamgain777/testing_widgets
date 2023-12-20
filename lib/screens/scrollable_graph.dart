import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';
import 'package:testing_widgets/widgets/zommable_chart.dart';

class ScroolableGraph extends StatefulWidget {
  const ScroolableGraph({super.key});

  @override
  State<ScroolableGraph> createState() => _ScroolableGraphState();
}

class _ScroolableGraphState extends State<ScroolableGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Scroolable Table"),
      ),
      body: 
      // AspectRatio(
      // aspectRatio: 16 / 9,
      // child: ZoomableChart(
      //   maxX: 20,
      //   builder: (minX, maxX) {
      //     return BarChart(
      //       BarChartData(
      //         barGroups: [
      //           BarChartGroupData(
      //               x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.blue, width: 40)]),
      //           BarChartGroupData(
      //               x: 1, barRods: [BarChartRodData(toY: 5, color: Colors.green, width: 40)]),
      //           BarChartGroupData(
      //               x: 0, barRods: [BarChartRodData(toY: 6, color: Colors.blue, width: 40)]),
      //           BarChartGroupData(
      //               x: 1, barRods: [BarChartRodData(toY: 1, color: Colors.green, width: 40)]),
      //           BarChartGroupData(
      //               x: 0, barRods: [BarChartRodData(toY: 3, color: Colors.blue, width: 40)]),
      //           BarChartGroupData(
      //               x: 1, barRods: [BarChartRodData(toY: 7, color: Colors.green, width: 40)]),
      //           BarChartGroupData(
      //               x: 1, barRods: [BarChartRodData(toY: 5, color: Colors.green, width: 40)]),
      //           // Add more BarChartGroupData for additional bars
      //         ],
      //         borderData: FlBorderData(
      //           show: true,
      //           border: Border.all(color: const Color(0xff37434d), width: 1),
      //         ),
      //         gridData: const FlGridData(show: true),
      //         groupsSpace: 20,
              
      //       ),
      //     );
      //   }
      // ),
      // ),
      AspectRatio(
      aspectRatio: 16 / 9,
      child: ZoomableChart(
        maxX: 2,
        builder: (minX, maxX) {
          return LineChart(
            LineChartData(
              clipData: const FlClipData.all(),
              minX: minX,
              maxX: maxX,
              lineTouchData: const LineTouchData(enabled: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 12),
                    FlSpot(1, 2),
                    FlSpot(2, 3),
                    FlSpot(3, 9),
                    FlSpot(4, 11),
                    FlSpot(5, 13),
                    FlSpot(6, 3),
                    FlSpot(7, 7),
                    FlSpot(8, 2),
                  ],
                  isCurved: false,
                  barWidth: 3,
                  color: Colors.indigo,
                  // dotData: FlDotData(
                  //   show: false,
                  // ),
                ),
              ],
              minY: 1,
              borderData: FlBorderData(
                show: false,
              ),
            ),
          );
        },
      ),
    )
    );
  }
}

      
