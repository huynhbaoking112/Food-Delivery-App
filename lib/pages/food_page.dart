import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // List<bool> check = [];

  // @override
  // void initState() {
  //   check = List<bool>.filled(widget.food.availableAddons.length, false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      // food price
                      Text(
                        '\$' + widget.food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //AddOn
                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              //get individual addon
                              Addon addon = widget.food.availableAddons[index];
                              //return checkbox
                              return CheckboxListTile(
                                  title: Text(addon.name),
                                  subtitle: Text('\$' + addon.price.toString()),
                                  value: widget.selectedAddons[addon],
                                  onChanged: (value) {
                                    setState(() {
                                      widget.selectedAddons[addon] =
                                          !widget.selectedAddons[addon]!;
                                    });
                                  });
                            }),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //button -> addon cart
                      MyButton(name: 'Add to cart', onTap: () {}),

                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //backbutton
        SafeArea(
            child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                        margin: EdgeInsets.only(left: 25, top: 20),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          )),
                    )))),
      ],
    );
  }
}
