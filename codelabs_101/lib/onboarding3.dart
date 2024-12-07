import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/momease.png',
                  width: 100.0,  // Set width to scale the image
                  height: 100.0, // Set height to scale the image
                  fit: BoxFit.contain,  // Ensure the aspect ratio is maintained
                  ),
              ],
            ),
            // Lottie Animation
            Expanded(
              child: Lottie.asset(
                'assets/animations/centang.json',
                fit: BoxFit.contain,
              ),
            ),
            // Title and Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child: Text(
                "You're All Set!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child: Text(
                'Your journey to finding the best care for you and your baby starts now.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24.0),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 100, 149, 237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Start Shopping',
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  // const SizedBox(height: 12.0),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
