import 'package:flutter/material.dart';

import 'package:task1/Screens/LoginOrSignUp/components/body.dart';

class LogOrSignUp extends StatelessWidget {
static const String RouteName="LorS";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body1(),
    );
  }
}
