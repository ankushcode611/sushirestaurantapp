import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurnatapp/components/button,.dart';
import 'package:sushirestaurnatapp/components/food_tile.dart';

import 'package:sushirestaurnatapp/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/shop.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to the items detailed page
  void navigateToFoodDetails(int index) {
    //get the shop and It's item menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and It's item menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[800],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Tokyo',
        ),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promotional Banner Message
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Promo message
                    Text(
                      'Get 32%Off Pormo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    //redeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    )
                  ],
                ),

                //image
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here.."),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          //Menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                  fontSize: 18),
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          // Popular Food Reccomendation
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //image
                    Image.asset(
                      "lib/images/simple_sushi.png",
                      height: 60,
                    ),

                    const SizedBox(width: 20),

                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //price
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),

                //heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
