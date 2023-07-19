import 'package:flutter/material.dart';

import 'package:task1/Screens/Login/Components/body2.dart';



class Login extends StatelessWidget {
  static const String RouteName="LOG";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body2(),

    );
  }
}
