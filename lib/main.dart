import 'package:flutter/material.dart';
import 'package:global_state/global_state.dart';
import 'package:provider/provider.dart';

import 'counter_list.dart';
import 'dynamic_screen.dart';
import 'error_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: MyGlobalApp(),
    ),
  );
}

class MyGlobalApp extends StatefulWidget {
  @override
  _MyGlobalAppState createState() => _MyGlobalAppState();
}

class _MyGlobalAppState extends State<MyGlobalApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MyHomeScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyHomeScreen(),
      routes: {
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/dynamic': (context) => DynamicScreen(arguments: ModalRoute.of(context)!.settings.arguments),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/invalid') {
          return MaterialPageRoute(builder: (_) => ErrorScreen());
        }
        // Handle other routes here
      },
      home: Scaffold(
        appBar: AppBar(title: Text('Global State Example')),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Second'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Third'),
          ],
        ),
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: CounterList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new counter
          Provider.of<GlobalState>(context, listen: false).addCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
