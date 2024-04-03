import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/cart_item.dart';

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
  List<CartItem> get cart => _cart;

  
  /*
      O P E R A T I O N S
  */
  //user cart
  final List<CartItem> _cart = [];


  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons ){
    
    // CartItem? cartItem = _cart.firstWhereOrNull((e){
      
    //   //check food match
    //   bool isSameFood = food == e.food;

    //   //check addon match
    //   bool isSameAddons = ListEquality().equals(selectedAddons, e.selectedAddons);

    //   return isSameFood && isSameAddons;
    // });

    //----------------------------------------//
    int index = _cart.indexWhere((e){

      bool isSameFood = food == e.food;

      bool isSameAddons = ListEquality().equals(selectedAddons, e.selectedAddons);

       return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity 
    if(index != -1){
      _cart[index].quantity += 1;
    }
    // otherwise, add a new cart item
    else{
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners(); 
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      _cart[cartIndex].quantity > 1 ? _cart[cartIndex].quantity-- : _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }
 

  //-- nang cap
  //get total price of cart
  double getTotalPriceOfCart(){
    return _cart.fold(0, (sum, e) => sum + e.totalPrice);
  }

  //get total number of items  in cart
  int getTotalItemCount(){
      return _cart.fold(0, (sum, e) => sum + e.quantity);
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }


  
  /*
      H E L P E R S
  */
  //generate a receipt

  //fomart double value into money

  //format list of addons into a string summary

}
