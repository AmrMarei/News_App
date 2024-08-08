import 'package:flutter/material.dart';
import 'package:new_app/home/home_screen.dart';
import 'package:new_app/my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      initialRoute: HomeScreen.routNme,
      routes: {
        HomeScreen.routNme : (context)=>HomeScreen(),
      },
    );
  }
}




