// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sales_app/configs/constant.dart';
import 'package:sales_app/screens/leadsScreens/AllLeadsScreen.dart';
// import 'package:flutter/services.dart';

class LeadsHomeScreen extends StatefulWidget {
  const LeadsHomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/LeadsHomeScreen';

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<LeadsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Leads"),
          backgroundColor: appPrimaryColor,
          // trailing: Icon(
          //   Icons.question_answer_rounded,
          // ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.sort_rounded,
                // color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'All Leads',
              ),
              Tab(
                text: 'New Leads',
              ),
              Tab(
                text: 'Deal Done',
              ),
              Tab(
                text: 'Keen Intrested',
              ),
              Tab(
                text: 'Visit Done',
              ),
              Tab(
                text: 'Contact in Future',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Leads(1),
            Leads(2),
            Leads(3),
            Leads(4),
            Leads(5),
            Leads(6),
          ],
        ),
      ),
    );
  }
}


// class LeadsHomeScreen extends StatelessWidget {
//   const LeadsHomeScreen({Key? key}) : super(key: key);
//   static const String routeName = '/LeadsHomeScreen';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appPrimaryColor,
//         title: const Text('All Leads'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add_alert),
//             tooltip: 'Show Snackbar',
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('This is a snackbar')));
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavBar(),
//       drawer: const LeadsDrawer(),
//     );
//   }
// }
