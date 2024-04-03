import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_current_location.dart';
import 'package:fooddelivery/components/my_description_box.dart';
import 'package:fooddelivery/components/my_drawer.dart';
import 'package:fooddelivery/components/my_sliver_app_bar.dart';
import 'package:fooddelivery/components/my_tab_bar.dart';

class HomePage extends StatefulWidget  {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  //tab controller
  late TabController _tabController; 


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              title: MyTabBar(tabController: _tabController,)
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(itemCount: 5 ,itemBuilder: (context, index) => Text('First Tab Items'),),
             ListView.builder(itemCount: 5 ,itemBuilder: (context, index) => Text('Second tab items'),),
             ListView.builder(itemCount: 5 ,itemBuilder: (context, index) => Text('Third tab items'),),
          ],
        ),
      ),
    );
  }
}
