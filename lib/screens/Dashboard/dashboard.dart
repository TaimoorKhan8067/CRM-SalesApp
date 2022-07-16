// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sales_app/screens/Dashboard/dashboardCards.dart';
import 'package:sales_app/screens/leadDrawer.dart';
// ignore: unused_import
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sales_app/screens/leadsHomeScreen.dart';

import '../../configs/constant.dart';
import '../../configs/fadeAnimation.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String routeName = '/Dashboard';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dream Land'),
          backgroundColor: appPrimaryColor,
          elevation: 0,
        ),
        drawer: const LeadsDrawer(),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                appPrimaryColor,
                appPrimaryColor2,
              ])),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.01),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: height * .03, color: appBackGroundColor),
                ),
                FadeAnimation(
                    3,
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "Mr. HASSAN NAEEM",
                          style: TextStyle(
                              fontSize: height * 0.05,
                              fontFamily: 'Horizon',
                              color: appBackGroundColor),
                        ),
                        Spacer()
                      ],
                    )),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    margin: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            DashboardCards("Leads", "All Leads Here",
                                LeadsHomeScreen.routeName),
                            const Spacer(),
                            DashboardCards("Projects", "All Projects Here",
                                LeadsHomeScreen.routeName),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            DashboardCards("Pricing", "All Pricing Here",
                                LeadsHomeScreen.routeName),
                            const Spacer(),
                            DashboardCards("Anything", " Anything Here",
                                LeadsHomeScreen.routeName),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
