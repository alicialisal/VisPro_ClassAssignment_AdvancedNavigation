import 'package:codelabs_101/login.dart';
import 'package:codelabs_101/onboarding1.dart';
import 'package:codelabs_101/onboarding2.dart';
import 'package:codelabs_101/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'backdrop.dart';
import 'cart.dart';
import 'category_menu_page.dart';
import 'colors.dart';
import 'detail_page.dart';
import 'home.dart';
import 'model/products.dart';
import 'profile.dart';
import 'supplemental/cut_corners_border.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/cart': (BuildContext context) => const CartPage(),
  '/profile': (BuildContext context) => const ProfilePage(),
};

class MomEaseApp extends StatefulWidget {
  const MomEaseApp({Key? key}) : super(key: key);

  @override
  _MomEaseAppState createState() => _MomEaseAppState();
}

class _MomEaseAppState extends State<MomEaseApp> {
  int _currentIndex = 0; // Index untuk Bottom Navigation
  Category _currentCategory = Category.all;

  // Daftar halaman untuk Bottom Navigation
  final List<Widget> _pages = [
    const HomePage(), // Halaman Home
    CartPage(), // Halaman Cart
    ProfilePage(), // Halaman Profile
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'momEase',
      initialRoute: '/onboardingscreen1',
      routes: {
        '/onboardingscreen1': (BuildContext context) => const OnboardingScreen(),
        '/onboardingscreen2': (BuildContext context) => const Onboarding2Screen(),
        '/onboardingscreen3': (BuildContext context) => const Onboarding3Screen(),
        '/login': (BuildContext context) => const LoginPage(),
        // '/homepage': (BuildContext context) => const HomePage(),
        '/cart': (BuildContext context) => const CartPage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        // '/dynamic': (BuildContext context) => const DynamicScreens(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/backdrop': (BuildContext context) => Backdrop(
             currentCategory: _currentCategory,
             // TODO: Pass_currentCategory for frontLayer (104)
             frontLayer: HomePage(category: _currentCategory),
             // TODO: Change backLayer field value to CategoryMenuPage (104)
             backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
             frontTitle: Text('MOMEASE'),
             backTitle: Text('MENU'),
        ),
        '/details': (context) => const DetailPage(
          productName: 'Default Name',
          productDescription: 'Default Description',
          price: 0,
          imageUrl: 'assets/default.png',
        ),
      },
      theme: _kShrineTheme,
      // home: Scaffold(
      //   body: IndexedStack(
      //     index: _currentIndex,
      //     children: _pages,
      //   ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: _currentIndex,
      //     onTap: (index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart),
      //         label: 'Cart',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBlue400,
      secondary: kShrineBlue500,
      error: kShrineErrorRed,
    ),
    // TODO: Add the text themes (103)
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kShrineBrown900,
      backgroundColor: kShrineBlue100,
    ),
    // TODO: Decorate the inputs (103)
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBlue500,
      ),
    ),
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return GoogleFonts.poppinsTextTheme(base).copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Poppins',
        displayColor: const Color.fromARGB(255, 0, 0, 0),
        bodyColor: const Color.fromARGB(255, 0, 0, 0),
      );
}