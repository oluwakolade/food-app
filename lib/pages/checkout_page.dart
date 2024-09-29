import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/payment_page.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/card_tile.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: const HeaderText(text: "Cart"),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const HeaderText(
                          text: "Are you sure you want to clear cart?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const BodyText(text: "Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const BodyText(text: "Cancel"),
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: BodyText(text: "Cart is Empty..."),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];

                                return CartTile(cartItem: cartItem);
                              }),
                        )
                ],
              ),
            ),

            const Spacer(),

            OutlineButton(
                text: "Checkout",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
                  );
                }),

            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
