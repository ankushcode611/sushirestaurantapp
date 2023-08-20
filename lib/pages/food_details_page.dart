import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushirestaurnatapp/components/button,.dart';
import 'package:sushirestaurnatapp/models/food.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushirestaurnatapp/themes/colors.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
//quantity
  int quantityCount = 0;

//decrement quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

//Increment quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
      ;
    });
  }

//Add to cart
  void addToCart() {
    //Only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let the user know that teh action was successful
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: const Text(
                  "Successfully added to cart",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  //okay button
                  IconButton(
                    onPressed: () {
                      //poop once to remove dialog box
                      Navigator.pop(context);
                      //pop again to go previous screen
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //rating
                  Row(
                    children: [
                      //star rating
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //food name

                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Discover the exquisite flavors of Uramaki Sushi, a delightful Japanese culinary creation that's as visually stunning as it is delicious. Uramaki, also known as 'inside-out' sushi, is a delectable masterpiece where the rice and ingredients are skillfully rolled with precision, resulting in a tantalizing taste experience. Each Uramaki roll features a vibrant assortment of fresh seafood, crisp vegetables, and creamy avocado, all expertly combined to create a harmonious blend of textures and tastes.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
          ),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              //price + quantity
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    //quantity

                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        //quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        //plus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),

                //Add to Cart button
                MyButton(text: "Add To Cart", onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
