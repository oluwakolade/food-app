import 'package:flutter/material.dart';
import 'package:food_app/models/cart_items.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/quantity_selector.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(
                        text: cartItem.food.name,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BodyText(
                        text: '\$${cartItem.food.price}',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      QuantitySelector(
                          food: cartItem.food,
                          onIncrement: () {
                            restaurant.addToCart(cartItem.food);
                          },
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          quantity: cartItem.quantity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
