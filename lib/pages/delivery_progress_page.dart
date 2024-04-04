import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [MyReceipt()],
      ),
    );
  }

  //Custom Bottom Nav Bar - Message // Call delivery dirver

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),

          const SizedBox(
            width: 10,
          ),
          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "King Huynh",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text("Driver",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary))
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
              Container(   
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.message), color: Theme.of(context).colorScheme.primary,),
              ),

              SizedBox(width: 15,),

              //call button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.call), color: Colors.green,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
