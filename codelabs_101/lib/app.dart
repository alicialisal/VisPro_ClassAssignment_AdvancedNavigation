import 'package:codelabs_101/onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'backdrop.dart';
import 'category_menu_page.dart';
import 'colors.dart';
import 'detail_page.dart';
import 'home.dart';
import 'model/products.dart';
import 'supplemental/cut_corners_border.dart';

class MomEaseApp extends StatefulWidget {
  const MomEaseApp({Key? key}) : super(key: key);

  @override
  _MomEaseAppState createState() => _MomEaseAppState();
}

class _MomEaseAppState extends State<MomEaseApp> {
  // const MomEaseApp({Key? key}) : super(key: key);
  Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'momEase',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const OnboardingScreen(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => Backdrop(
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
