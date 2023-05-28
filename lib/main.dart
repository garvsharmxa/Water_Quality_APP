import 'package:flutter/material.dart';
import 'Nav/BottomNav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Quality Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}

