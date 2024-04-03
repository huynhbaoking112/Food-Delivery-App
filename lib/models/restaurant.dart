import 'package:flutter/material.dart';

import 'food.dart';

class Restaurent extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
        name: "Classic Cheeseburger",
        description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: 'lib/images/burgers/cheese_burger.jpeg',
        price: 0.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),

    //salads
     Food(
        name: "Classic Salad",
        description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: 'lib/images/salads/salad.jpeg',
        price: 0.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),


    //sides
     Food(
        name: "Classic Cheeseburger",
        description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: 'lib/images/burgers/cheese_burger.jpeg',
        price: 0.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),


    //desserts
     Food(
        name: "Classic Dessert",
        description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: 'lib/images/desserts/dessert.jpeg',
        price: 0.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),


    //drinks
     Food(
        name: "Classic Coca",
        description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: 'lib/images/drinks/coca.jpeg',
        price: 0.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),

  ];



  /*
      G E T T E R S

  */
  List<Food> get menu =>  _menu; 
   

  
  /*
      O P E R A T I O N S
  */

  //add to cart

  //remove from cart

  //get total price of cart

  //get total number of items  in cart

  //clear cart



  
  /*
      H E L P E R S
  */
  //generate a receipt

  //fomart double value into money

  //format list of addons into a string summary

}
