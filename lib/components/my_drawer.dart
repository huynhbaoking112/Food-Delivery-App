import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/components/my_drawer_tile.dart';
import 'package:fooddelivery/pages/home.dart';
import 'package:fooddelivery/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          //Divider
          Padding(
            padding: EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile
          MyDrawrtTile(icon: Icons.home, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }, text: 'H O M E'),
         
          //Setting list tile
          MyDrawrtTile(icon: Icons.settings, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
          }, text: 'S E T T I N G S'),
          
          Spacer(),

          //Logout list tile
          MyDrawrtTile(icon: Icons.logout, onTap: (){}, text: 'L O G O U T '),

          SizedBox(height: 25,)



        ],
      ),
    );
  }
}
