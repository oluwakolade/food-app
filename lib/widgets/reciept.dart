import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class Reciept extends StatelessWidget {
  const Reciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderText(text: "Thanks for your order"),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) =>
                    Text(restaurant.displayReceipt()),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const HeaderText(text: "Estimated delivery time: 3:00pm"),
          ],
        ),
      ),
    );
  }
}
