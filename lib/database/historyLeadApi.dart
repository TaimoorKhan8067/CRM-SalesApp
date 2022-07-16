import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../providers/historyLeadDetails.dart';

Future<List<HistoryLead>> fetchNames() async {
  List<HistoryLead> names = [];
  String url = "https://mocki.io/v1/03d1df01-10c0-44d9-bbfd-a839d61b26e5";
  // String url = "http://universities.hipolabs.com/search?country=United+States";
  final response = await http.get(Uri.parse(url));
// https://raw.githubusercontent.com/Hipo/university-domains-list/master/world_universities_and_domains.json

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // var namesJson = jsonDecode(response.body);
    // print(response.body);
    for (int i = 0; i < 2; i++) {
      names.add(HistoryLead.fromJson(jsonDecode(response.body)[i]));
    }
    return names;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load names');
  }
}
