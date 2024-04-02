import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //ConfigSwitch
          Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode
                Text("Dark Mode",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),

                //Switch
                CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) =>
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme())
              ],
            ),
          )
        ],
      ),
    );
  }
}
