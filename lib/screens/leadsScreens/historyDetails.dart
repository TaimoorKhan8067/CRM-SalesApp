import 'package:flutter/material.dart';

import '../../database/historyLeadApi.dart';
import '../../providers/historyLeadDetails.dart';

// ignore: use_key_in_widget_constructors
class HistoryLeadDataTable extends StatefulWidget {
  @override
  _HistoryLeadDataTable createState() => _HistoryLeadDataTable();
}

class _HistoryLeadDataTable extends State<HistoryLeadDataTable> {
  late Future<List<HistoryLead>> futureNames;

  @override
  void initState() {
    super.initState();
    futureNames = fetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          FutureBuilder<List<HistoryLead>>(
            initialData: const <HistoryLead>[],
            future: fetchNames(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.data == null ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Remarks',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Created By',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Created On',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Next Follow Up',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: List.generate(
                  snapshot.data!.length,
                  (index) {
                    var temp = snapshot.data![index];
                    return DataRow(cells: [
                      DataCell(
                        Text(temp.status),
                      ),
                      DataCell(
                        Text(temp.remarks),
                      ),
                      DataCell(
                        Text(temp.createdBy),
                      ),
                      DataCell(
                        Text(temp.createdOn),
                      ),
                      DataCell(
                        Text(temp.nextFollow),
                      ),
                    ]);
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
