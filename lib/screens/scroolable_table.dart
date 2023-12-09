import 'package:flutter/material.dart';
import 'package:testing_widgets/common/common_appbar.dart';

class ScroolableTable extends StatefulWidget {
  const ScroolableTable({super.key});

  @override
  State<ScroolableTable> createState() => _ScroolableTableState();
}

class _ScroolableTableState extends State<ScroolableTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CommonAppbar(appbarTitle: "Scroolable Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Header 1')),
                DataColumn(label: Text('Header 2')),
                DataColumn(label: Text('Header 3')),
                DataColumn(label: Text('Header 4')),
                DataColumn(label: Text('Header 5')),
                // Add more DataColumn as needed
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Data 1A')),
                  DataCell(Text('Data 2A')),
                  DataCell(Text('Data 3A')),
                  DataCell(Text('Data 4A')),
                  DataCell(Text('Data 5A')),
                  // Add more DataCells as needed
                ]),
                DataRow(cells: [
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(
                    Text('Data 1B'),
                  ),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  // DataCell(Text('Data 2B')),
                  // DataCell(Text('Data 3B')),
                  // DataCell(Text('Data 4B')),
                  // DataCell(Text('Data 5B')),
                  // Add more DataCells as needed
                ]),
                // Add more DataRow as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
