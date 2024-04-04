import 'package:flutter/material.dart';
import 'package:fooddelivery/auth/login_or_register.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/pages/delivery_progress_page.dart';
import 'package:fooddelivery/pages/home.dart';
import 'package:fooddelivery/pages/login_page.dart';
import 'package:fooddelivery/pages/register.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      //theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),

      //restaurent provider
      ChangeNotifierProvider(
        create: (context) => Restaurent(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const LoginOrRegister(),
      home: DeliveryProgressPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
