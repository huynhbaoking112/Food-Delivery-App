import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/pages/cart_page.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        Stack(children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? Colors.white
                    : Colors.black,
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              // margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Text(
                Provider.of<Restaurent>(context).getTotalItemCount().toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ],
      title: const Text("Sunset Diner"),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
