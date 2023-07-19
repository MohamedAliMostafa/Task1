import 'package:flutter/material.dart';
import 'package:task1/Screens/Login/Login.dart';
import 'package:task1/Screens/Register/Register.dart';

import '../../../Components/Compo.dart';
import '../../../Constants.dart';

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          Padding(
            padding:  const EdgeInsets.only(left: 40),
            child: Container(
              height: 300,
              width: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/img.jpg"),fit: BoxFit.fill)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding:  const EdgeInsets.only(left: 60),
            child: defaultButton(onPress: () {
              Navigator.pushReplacementNamed(context, Login.RouteName);
            },txt: login ,colorTxT: Colors.white,shapeColor: const Color(0xff061a52)),
          ),       // Login
          const SizedBox(height: 30,),
          Padding(
            padding:  const EdgeInsets.only(left: 60),
            child: defaultButton(onPress: () {
              Navigator.pushReplacementNamed(context, Register.RouteName);
            },txt: reg ,colorTxT: Colors.blue  ,shapeColor: const Color(0xffafb4b4)),
          ),         // Reg
          const SizedBox(height: 80,),
          Padding(
            padding:  const EdgeInsets.only(left: 60),
            child: Text(ABs,style:  const TextStyle(fontSize: 18,fontFamily: "Changa",color:Colors.black ),),
          ),

        ],
      ),
    );
  }
}
