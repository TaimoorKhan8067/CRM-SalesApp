import 'package:flutter/material.dart';
import '../../database/propertyDataApi.dart';
import '../../providers/propertyDetails.dart';

// ignore: use_key_in_widget_constructors
class PropertyDataTable extends StatefulWidget {
  @override
  _PropertyDataTable createState() => _PropertyDataTable();
}

class _PropertyDataTable extends State<PropertyDataTable> {
  late Future<List<Property>> futureNames;

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
          child: FutureBuilder<List<Property>>(
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
                                    'Property',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Project - City	',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Society',
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
                                    'Creator',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Updated On	',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Updated By',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(snapshot.data![index].type)),
                                    DataCell(Text(snapshot.data![index].city)),
                                    DataCell(
                                        Text(snapshot.data![index].society)),
                                    DataCell(
                                        Text(snapshot.data![index].createdOn)),
                                    DataCell(Text(
                                        snapshot.data![index].creatorName)),
                                    DataCell(
                                        Text(snapshot.data![index].updatedOn)),
                                    DataCell(
                                        Text(snapshot.data![index].updatedBy)),
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
