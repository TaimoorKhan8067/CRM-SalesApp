import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../providers/propertyDetails.dart';

Future<List<Property>> fetchNames() async {
  List<Property> names = [];
  String url = "https://mocki.io/v1/fe30fa08-3e95-426c-b8da-af59fa517041";
  // String url = "http://universities.hipolabs.com/search?country=United+States";
  final response = await http.get(Uri.parse(url));
// https://raw.githubusercontent.com/Hipo/university-domains-list/master/world_universities_and_domains.json
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // var namesJson = jsonDecode(response.body);
    // print(response.body);
    for (int i = 0; i < 1; i++) {
      names.add(Property.fromJson(jsonDecode(response.body)[i]));
    }
    return names;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load names');
  }
}
