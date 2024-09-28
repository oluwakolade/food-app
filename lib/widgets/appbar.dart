import 'package:flutter/material.dart';
import 'package:food_app/pages/checkout_page.dart';
import 'package:food_app/widgets/text.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const CustomSliverAppBar(
      {super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      collapsedHeight: 120,
      floating: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutPage(),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Logo(text: "KOLLZBBQ"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding:
            const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
