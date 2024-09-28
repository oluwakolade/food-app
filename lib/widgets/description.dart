import 'package:flutter/material.dart';
import 'package:food_app/widgets/text.dart';

class DescriptionInfo extends StatelessWidget {
  const DescriptionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,

        // border: Border.all(
        //   color: Theme.of(context).colorScheme.secondary,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BodyText(
                text: "\$1.99",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.surface,
              ),
              BodyText(
                text: "Delivery Fee",
                color: Theme.of(context).colorScheme.surface,
              ),
            ],
          ),
          Column(
            children: [
              BodyText(
                text: "15-30 min",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.surface,
              ),
              BodyText(
                text: "Delivery Time",
                color: Theme.of(context).colorScheme.surface,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
