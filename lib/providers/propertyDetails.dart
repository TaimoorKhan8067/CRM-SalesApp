import 'package:flutter/material.dart';

class Property extends ChangeNotifier {
  final String type;
  final String city;
  final String society;
  final String creatorName;
  final String createdOn;
  final String updatedOn;
  final String updatedBy;

  Property({
    required this.type,
    required this.city,
    required this.society,
    required this.creatorName,
    required this.createdOn,
    required this.updatedOn,
    required this.updatedBy,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      type: json["type"].toString(),
      city: json["city"].toString(),
      society: json["society"].toString(),
      creatorName: json["creatorName"].toString(),
      createdOn: json["createdOn"].toString(),
      updatedOn: json["updatedOn"].toString(),
      updatedBy: json["updatedBy"].toString(),
    );
  }
}
