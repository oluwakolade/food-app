import 'package:flutter/material.dart';
import 'package:food_app/models/bbq_model.dart';
import 'package:food_app/utilities/capitalize.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return MeatCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last.capitalize(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabController, tabs: _buildCategoryTabs()),
    );
  }
}
