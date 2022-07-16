import 'package:flutter/material.dart';
import 'package:sales_app/configs/constant.dart';
import 'package:sales_app/screens/navBarScreens/leadsNavBar.dart';

// ignore: use_key_in_widget_constructors
class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _onchangeScreen() {
    //  _selectedIndex == 1
    //                     ? const LeadsHomePage()
    //                     :
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _onchangeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Leads',
          backgroundColor: appPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          backgroundColor: appPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: appPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: appPrimaryColor,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: appBackGroundColor,
      onTap: _onItemTapped,
    );
  }
}
