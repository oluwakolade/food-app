import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  CurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearch(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const HeaderText(text: "Your Location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter address...'),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const BodyText(text: "Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);

              textController.clear();
            },
            child: const BodyText(text: "Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyText(
            text: 'Deliver Here',
          ),
          GestureDetector(
            onTap: () => openLocationSearch(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => BodyText(
                    text: restaurant.deliveryAddress,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
