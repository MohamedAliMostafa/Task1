import 'package:flutter/material.dart';
import 'package:task1/Screens/Home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:Home.RouteNAME ,
      routes: {

        Home.RouteNAME:(context)=>Home(),

      },
    );
  }
}