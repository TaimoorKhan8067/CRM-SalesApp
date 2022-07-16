import 'package:flutter/material.dart';
import 'package:sales_app/screens/leadsScreens/historyDetails.dart';

class HistoryDialog extends StatelessWidget {
  final String status, remarks, createdBy, createdOn, nextFollow;
  // final Image image;

  // ignore: use_key_in_widget_constructors
  const HistoryDialog({
    required this.status,
    required this.remarks,
    required this.createdBy,
    required this.createdOn,
    required this.nextFollow,
    // required this.image,
  });

  @override
  Widget build(BuildContext context) {
    dialogContent(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            const Text(
              "History of Lead",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(),
            HistoryLeadDataTable(),
          ],
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
