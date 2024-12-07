import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  final dynamic arguments;

  DynamicScreen({required this.arguments});

  @override
  Widget build(BuildContext context) {
    int screenCount = arguments; // Example: a number passed as argument
    List<Widget> dynamicScreens = List.generate(screenCount, (index) {
      return Scaffold(
        appBar: AppBar(title: Text('Dynamic Screen $index')),
        body: Center(child: Text('This is screen #$index')),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screens')),
      body: ListView.builder(
        itemCount: dynamicScreens.length,
        itemBuilder: (context, index) {
          return dynamicScreens[index];
        },
      ),
    );
  }
}
