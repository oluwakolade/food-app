import 'package:flutter/material.dart';
import 'package:food_app/widgets/text.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const DrawerTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: BodyText(
          text: text,
        ),
        leading: Icon(
          icon,
        ),
        onTap: onTap,
      ),
    );
  }
}
