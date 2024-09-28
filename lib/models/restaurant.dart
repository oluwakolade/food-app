import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cart_items.dart';
import 'package:intl/intl.dart';
import 'bbq_model.dart';

class Restaurant extends ChangeNotifier {
  final List<BbqModel> _menu = [
    //steak,
    BbqModel(
        name: "Flame Grilled Steak",
        description:
            "Steak seasoned and grilled to perfection with our special Sauce",
        price: 3.99,
        imagePath: "assets/flame_grilled_steak.jpg",
        category: MeatCategory.steak),
    BbqModel(
        name: "Flame Broiled Steak",
        description:
            "Steak seasoned and Broiled to perfection with our special Sauce",
        price: 3.99,
        imagePath: "assets/flame-broiled-steak.jpg",
        category: MeatCategory.steak),
    BbqModel(
        name: "Rib Eye Steak",
        description:
            "Steak seasoned and grilled to perfection with our special Sauce",
        price: 3.99,
        imagePath: "assets/rib-eye-steak-on-bbq.jpg",
        category: MeatCategory.steak),

    //chicken,
    BbqModel(
        name: "Grilled Chicken Drumsticks",
        description:
            "Chicken Drumsticks seasoned and grilled to perfection with our special Sauce",
        price: 4.99,
        imagePath: "assets/grilled-chicken-drumsticks.jpg",
        category: MeatCategory.chicken),
    BbqModel(
        name: "Grilled Chicken Kabobs",
        description:
            "Chicken Kabobs seasoned and grilled to perfection with our special Sauce",
        price: 4.99,
        imagePath: "assets/grilled-chicken-kabobs.jpg",
        category: MeatCategory.chicken),

    //turkey,
    BbqModel(
        name: "Grilled Turkey Legs",
        description:
            "Turkey Legs seasoned and grilled to perfection with our special Sauce",
        price: 4.99,
        imagePath: "assets/turkey_legs.jpg",
        category: MeatCategory.turkey),
    BbqModel(
        name: "Turkey Sausage",
        description:
            "Turkey sausage seasoned and grilled to perfection with our special Sauce",
        price: 4.99,
        imagePath: "assets/turkey_sausage.jpg",
        category: MeatCategory.turkey),

    //sides
    BbqModel(
        name: "Steak Taco",
        description: "Steak Taco made to perfection",
        price: 4.99,
        imagePath: "assets/taco.jpg",
        category: MeatCategory.sides),

    BbqModel(
        name: "Hamburger",
        description: "Hamburger made to perfection",
        price: 4.99,
        imagePath: "assets/burger.jpg",
        category: MeatCategory.sides),

    BbqModel(
        name: "Roasted Corn",
        description: "Corn roasted to perfection",
        price: 4.99,
        imagePath: "assets/corn.jpg",
        category: MeatCategory.sides),
  ];

  final List<CartItem> _cart = [];

  String _deliveryAddress = 'Unilag Akoka';

  //getters
  List<BbqModel> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //operation
  //cart
  //add to cart
  void addToCart(BbqModel food) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      return isSameFood;
    });
    //increase quantity of item exists

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food),
      );
    }

    notifyListeners();
  }

  // remove

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
  // get total rpice

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // total number of items

  int getTotalItem() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //helpers
  //generate reciept

  String displayReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your Reciept");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      receipt.writeln();
    }

    receipt.writeln("--------------------");
    receipt.writeln();

    receipt.writeln("Items: ${getTotalItem()}");
    receipt.writeln("Total: ${_formatPrice(
      getTotalPrice(),
    )}");
        receipt.writeln();
    receipt.writeln('Delivery to : $deliveryAddress');


    return receipt.toString();
  }

  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  //format double value into oney
}
