import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food.dart';

class MyTabBar extends StatelessWidget {

  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((e) => Tab(
      text: e.toString().split('.').last,
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs()
      ),
    );
  }
} 