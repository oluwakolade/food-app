import 'package:flutter/material.dart';
import 'package:food_app/models/bbq_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  final BbqModel food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
//add to cart method
  void addToCart(BbqModel food) {
    Navigator.pop(context);

    context.read<Restaurant>().addToCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.food.imagePath),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(
                      text: widget.food.name,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BodyText(
                      text: widget.food.description,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BodyText(
                      text: '\$${widget.food.price}',
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              OutlineButton(
                  text: 'Add to Cart', ontap: () => addToCart(widget.food)),

              const SizedBox(
                height: 10,
              ),
              // add to cart button
            ],
          ),
        ),
      ),
//back button

      SafeArea(
        child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
