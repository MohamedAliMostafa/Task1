import 'package:flutter/material.dart';
import 'package:task1/Screens/Register/Components/body3.dart';

class Register extends StatelessWidget {
static const String RouteName="regis";
  @override
  Widget build(BuildContext context) {

    return Scaffold(resizeToAvoidBottomInset: false,
      body: Body3(),

    );
  }
}
