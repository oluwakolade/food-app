import 'package:food_app/models/bbq_model.dart';

class CartItem {
  BbqModel food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});

  double get totalPrice {
    return food.price * quantity;
  }
}
