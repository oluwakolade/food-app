import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/services/database/firestore.dart';
import 'package:food_app/widgets/reciept.dart';
import 'package:food_app/widgets/text.dart';
import 'package:provider/provider.dart';

class DevliveryPage extends StatefulWidget {
  const DevliveryPage({super.key});

  @override
  State<DevliveryPage> createState() => _DevliveryPageState();
}

class _DevliveryPageState extends State<DevliveryPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String receipt = context.read<Restaurant>().displayReceipt();
    db.saveOrder(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          Reciept(),
        ],
      ),
    );
  }

  //btm nav bar
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HeaderText(text: "John Doe"), BodyText(text: "Driver")],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
