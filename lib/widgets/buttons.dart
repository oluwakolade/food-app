import 'package:flutter/material.dart';
import 'package:food_app/widgets/text.dart';

class FillButton extends StatelessWidget {
  final Function()? ontap;
  final String text;
  const FillButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: BodyText(
            text: text,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final Function()? ontap;
  final String text;
  const OutlineButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
        ),
        child: Center(
          child: BodyText(
            text: text,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
