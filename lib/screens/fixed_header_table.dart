import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class FixedHeaderTable extends StatefulWidget {
  const FixedHeaderTable({super.key});

  @override
  State<FixedHeaderTable> createState() => _FixedHeaderTableState();
}

class _FixedHeaderTableState extends State<FixedHeaderTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Fixed Header"),
      ),
      body: Column(
      children: [
        // Fixed Header
        // DataTable(
        //   columnSpacing: 20.0, // Adjust as needed
        //   columns: List.generate(
        //     10,
        //     (index) => DataColumn(
        //       label: Text('Header $index'),
        //     ),
        //   ),
        // ),
        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 20.0, // Adjust as needed
                columns: List.generate(
                  10,
                  (index) => DataColumn(
                    label: Text('Header $index'),
                  ),
                ),
                rows: List.generate(
                  20,
                  (index) => DataRow(
                    cells: List.generate(
                      10,
                      (cellIndex) => DataCell(
                        Text('Data $index-$cellIndex'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      )
    );
  }
}
