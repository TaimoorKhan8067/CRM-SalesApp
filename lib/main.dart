// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sales_app/screens/Dashboard/dashboard.dart';
import 'package:sales_app/screens/leadsHomeScreen.dart';
import 'package:sales_app/screens/signInScreen.dart';

// ! import here file animate

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //     headline3: TextStyle(
      //         fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.red),
      //   ),
      // ),
      home: SignInScreen(),
      routes: <String, WidgetBuilder>{
        LeadsHomeScreen.routeName: (_) => LeadsHomeScreen(),
        Dashboard.routeName: (_) => Dashboard(),
      },
    );
  }
}
