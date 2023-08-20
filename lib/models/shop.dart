import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //uramaki sushi
    Food(
        name: "Uramaki Sushi",
        price: "21.00",
        imagePath: "lib/images/uramaki_sushi.png",
        rating: "4.9"),
    //tuna sushi
    Food(
      name: "Tuna Sushi",
      price: "21.00",
      imagePath: "lib/images/tuna_sushi.png",
      rating: "4.3",
    ),
  ];

  // customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
