import 'package:flutter/material.dart';
import 'package:food_app/pages/settings_page.dart';
import 'package:food_app/services/auth/auth_service.dart';
import 'package:food_app/widgets/buttons.dart';
import 'package:food_app/widgets/drawer_tile.dart';
import 'package:food_app/widgets/text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 15), child: const Logo()),
          //app logo

          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //menu tiles

          DrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              }),

          const Spacer(),

          OutlineButton(text: 'Log Out', ontap: logOut),

          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
