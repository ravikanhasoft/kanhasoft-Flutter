import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  List<BottomNavigationBarItem> barItem = [];

  MyBottomNavBar({super.key, required this.barItem});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: barItem);
  }
}
