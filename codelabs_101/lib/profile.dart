import 'package:flutter/material.dart';

import 'app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalize'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter a number to generate dynamic screens:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final inputText = _controller.text;
                if (inputText.isNotEmpty) {
                  final numberOfScreens = int.tryParse(inputText);
                  if (numberOfScreens != null && numberOfScreens > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DynamicScreens(count: numberOfScreens),
                      ),
                    );
                  } else {
                    // Show an error message for invalid input
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid positive number!')),
                    );
                  }
                } else {
                  // Show an error message for empty input
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Input cannot be empty!')),
                  );
                }
              },
              child: const Text('Generate Screens'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Index for ProfilePage
        onTap: (int index) {
          String? routeName;
          if (index == 0) {
            routeName = '/backdrop';
          } else if (index == 1) {
            routeName = '/cart';
          }

          if (routeName != null) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    appRoutes[routeName]!(context),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class DynamicScreens extends StatelessWidget {
  final int count;

  const DynamicScreens({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screens ($count)')),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          final int screenNumber = index + 1;
          return ListTile(
            title: Text('Screen $screenNumber'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DynamicScreenDetail(screenNumber: screenNumber),
                  ),
                );
              },
              child: const Text('Open'),
            ),
          );
        },
      ),
    );
  }
}

class DynamicScreenDetail extends StatelessWidget {
  final int screenNumber;

  const DynamicScreenDetail({Key? key, required this.screenNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen $screenNumber')),
      body: Center(
        child: Text(
          'Welcome to Screen $screenNumber',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
