import 'package:flutter/material.dart';
import 'package:gee/Screen/Ui.dart';
import 'package:gee/Screen/mapScreen.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key,});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentstate = 0;
  String? loginToken;

  void _onItemTapped(int index) {
    setState(() {
      currentstate = index;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      WaterQualityMonitoring(),
      MapScreen(),

    ];
    return Scaffold(
      body: IndexedStack(
        index: currentstate,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        surfaceTintColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        selectedIndex: currentstate,
        onDestinationSelected: (index) {
          _onItemTapped(index);
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }
}
