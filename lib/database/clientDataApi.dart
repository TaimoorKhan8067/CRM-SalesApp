import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sales_app/providers/clientDetails.dart';

Future<List<Client>> fetchNames() async {
  List<Client> names = [];
  // String url = "http://universities.hipolabs.com/search?country=United+States";
  String url = "https://mocki.io/v1/a51956ce-cd65-4822-9abe-5f0e2acd6f51";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // var namesJson = jsonDecode(response.body);
    // print(response.body);
    for (int i = 0; i < 1; i++) {
      names.add(Client.fromJson(jsonDecode(response.body)[i]));
    }
    return names;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load names');
  }
}
