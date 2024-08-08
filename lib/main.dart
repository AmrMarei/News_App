import 'package:flutter/material.dart';
import 'package:new_app/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routNme,
      routes: {
        HomeScreen.routNme : (context)=>HomeScreen(),
      },
    );
  }
}




