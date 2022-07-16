import 'package:flutter/material.dart';

class Client extends ChangeNotifier {
  final String name;
  final String phoneNumber;
  final String email;
  final String companyName;
  final String createdOn;
  final String type;

  Client({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.companyName,
    required this.createdOn,
    required this.type,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      name: json["name"].toString(),
      phoneNumber: json["phoneNumber"].toString(),
      email: json["email"].toString(),
      companyName: json["companyName"].toString(),
      createdOn: json["createdOn"].toString(),
      type: json["type"].toString(),
    );
  }
}
