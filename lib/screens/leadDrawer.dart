import 'package:flutter/material.dart';

import '../configs/constant.dart';

class LeadsDrawer extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LeadsDrawer() : super();

  @override
  _LeadsDrawerState createState() => _LeadsDrawerState();
}

class _LeadsDrawerState extends State<LeadsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Center(
            child: DrawerHeader(
              child: Text('Any Logo Here'),
            ),
          ),
          ListTile(
            title: const Text('Lead Type 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Lead Type 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
