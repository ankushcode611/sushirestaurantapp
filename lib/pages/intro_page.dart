// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushirestaurnatapp/components/button,.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            //name of the shop
            Text(
              "SUSHI ME",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/simple_sushi.png'),
            ),

            //title
            Text(
              "TASTE THE FLAVOURS OF JAPAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            //subtitle
            Text(
              "Experience the most popular Japanese food from anywhere at anytime, right to your doorstep",
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(height: 25),

            //Cta button
            MyButton(text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
