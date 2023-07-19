import 'package:flutter/material.dart';

class Home extends StatelessWidget {
static const String RouteNAME="hOME";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Successfull authentication",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontFamily: "Changa",fontSize: 35,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
