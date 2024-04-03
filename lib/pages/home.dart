import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_current_location.dart';
import 'package:fooddelivery/components/my_description_box.dart';
import 'package:fooddelivery/components/my_drawer.dart';
import 'package:fooddelivery/components/my_food_tile.dart';
import 'package:fooddelivery/components/my_sliver_app_bar.dart';
import 'package:fooddelivery/components/my_tab_bar.dart';
import 'package:fooddelivery/models/food.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//sort out and return a list of food items that belong to a specific category
  List<Food> _fillterMenuByCategory(
      FoodCategory category, List<Food> fullmenu) {
    return fullmenu.where((element) => element.category == category).toList();
  }

//return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullmenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _fillterMenuByCategory(category, fullmenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get invidual food and return food tile
          return FoodTile(onTap: (){}, food: categoryMenu[index]);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        //my current location
                        MyCurrentLocation(),

                        //description box
                        MyDescriptionBox()
                      ],
                    ),
                    title: MyTabBar(
                      tabController: _tabController,
                    ))
              ],
          body: Consumer<Restaurent>(
            builder: (context, restaurent, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurent.menu),
            ),
          )),
    );
  }
}
