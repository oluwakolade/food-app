import 'package:flutter/material.dart';
import 'package:food_app/models/bbq_model.dart';
import 'package:food_app/widgets/text.dart';

class FoodTile extends StatelessWidget {
  final BbqModel food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderText(
                        text: food.name,
                      ),
                      BodyText(
                        text: food.description,
                      ),
                      BodyText(
                        text: '\$${food.price}',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: 120,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }
}
