import 'package:flutter/material.dart';
import 'dart:developer';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Your Cart Items'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Index for CartPage
        onTap: (int index) {
          String? routeName;
          if (index == 0) {
            routeName = '/backdrop';
          } else if (index == 2) {
            routeName = '/profile';
          }
          
          if (routeName != null) {
            Navigator.of(context).push(
              PageRouteBuilder(
                settings: RouteSettings(name: routeName), // Tetap gunakan nama rute
                pageBuilder: (context, animation, secondaryAnimation) {
                  // Ambil widget berdasarkan nama rute dari MaterialApp
                  final widgetBuilder =
                      context.findAncestorWidgetOfExactType<MaterialApp>()?.routes?[routeName];
                  return widgetBuilder!(context);
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          } else {
            log('Navigation error: Route not found for "$routeName"');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Route not found: $routeName'),
                duration: Duration(seconds: 2),
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
