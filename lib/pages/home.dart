import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
    );
  }
}