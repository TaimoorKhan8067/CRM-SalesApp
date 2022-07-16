import 'package:flutter/material.dart';

class HistoryLead extends ChangeNotifier {
  final String status;
  final String createdBy;
  final String createdOn;
  final String remarks;
  final String nextFollow;

  HistoryLead({
    required this.status,
    required this.createdBy,
    required this.createdOn,
    required this.remarks,
    required this.nextFollow,
  });

  factory HistoryLead.fromJson(Map<String, dynamic> json) {
    return HistoryLead(
      status: json["status"].toString(),
      createdBy: json["createdBy"].toString(),
      createdOn: json["createdOn"].toString(),
      remarks: json["remarks"].toString(),
      nextFollow: json["nextFollow"].toString(),
    );
  }
}
