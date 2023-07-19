import 'package:flutter/material.dart';
import 'package:task1/Screens/Home/Home.dart';
import 'package:task1/Screens/Login/Login.dart';
import 'package:task1/Screens/LoginOrSignUp/LoginOrSignUp.dart';
import 'package:task1/Screens/Register/Register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LogOrSignUp.RouteName ,
      routes: {
        LogOrSignUp.RouteName:(context)=>LogOrSignUp(),
        Login.RouteName:(context)=>Login(),
        Register.RouteName:(context)=>Register(),
        Home.RouteNAME:(context)=>Home(),

      },
    );
  }
}