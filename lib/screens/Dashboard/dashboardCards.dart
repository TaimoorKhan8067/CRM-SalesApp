// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../configs/constant.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DashboardCards extends StatelessWidget {
  String name;
  String subtitle;
  String route;
  // ignore: use_key_in_widget_constructors
  DashboardCards(this.name, this.subtitle, this.route);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
        child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: width * 0.45,
        height: height * 0.28,
        // padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [appPrimaryColor, appPrimaryColor2],
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.device_unknown_rounded,
                  size: 60,
                  color: appBackGroundColor,
                ),
                Text(name,
                    style: const TextStyle(
                        fontSize: 30.0, color: appBackGroundColor)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 18.0, color: appBackGroundColor)),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
