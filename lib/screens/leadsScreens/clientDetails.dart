import 'package:flutter/material.dart';

import '../../database/ClientDataApi.dart';
import '../../providers/clientDetails.dart';

// ignore: use_key_in_widget_constructors
class ClientDataTable extends StatefulWidget {
  @override
  _ClientDataTable createState() => _ClientDataTable();
}

class _ClientDataTable extends State<ClientDataTable> {
  late Future<List<Client>> futureNames;

  @override
  void initState() {
    super.initState();
    futureNames = fetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: FutureBuilder<List<Client>>(
            future: futureNames,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Contact Name	',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Contact Number		',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Email Address',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Company Name',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Created On',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Client/Dealer',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(snapshot.data![index].name)),
                                    DataCell(Text(
                                        snapshot.data![index].phoneNumber)),
                                    DataCell(Text(snapshot.data![index].email)),
                                    DataCell(Text(
                                        snapshot.data![index].companyName)),
                                    DataCell(
                                        Text(snapshot.data![index].createdOn)),
                                    DataCell(Text(snapshot.data![index].type)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
