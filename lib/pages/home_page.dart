import 'package:flutter/material.dart';
import 'package:food_app/models/bbq_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/food_details_page.dart';
import 'package:food_app/widgets/appbar.dart';
import 'package:food_app/widgets/description.dart';
import 'package:food_app/widgets/drawer.dart';
import 'package:food_app/widgets/foodtile.dart';
import 'package:food_app/widgets/location.dart';
import 'package:food_app/widgets/tabbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: MeatCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  List<BbqModel> _filterMenu(MeatCategory category, List<BbqModel> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //list builder

  List<Widget> getFoodCategory(List<BbqModel> fullMenu) {
    return MeatCategory.values.map((category) {
      List<BbqModel> categoryMenu = _filterMenu(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final food = categoryMenu[index];
            return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetails(food: food),
                ),
              ),
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxisScrolled) => [
                CustomSliverAppBar(
                  title: CustomTabBar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //location
                      CurrentLocation(),

                      //description box
                      const DescriptionInfo()
                    ],
                  ),
                )
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodCategory(restaurant.menu),
            ),
          )),
    );
  }
}
