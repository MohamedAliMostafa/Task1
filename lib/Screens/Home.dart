
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task1/Screens/Tabs/imagedectect.dart';
import 'package:task1/Screens/Tabs/textdetect.dart';

class Home extends StatefulWidget {
static const String RouteNAME="hOME";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

int index=0;
List<Widget>Tab=[TextDetection(),ImageDetect()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
          onTap: (value) {
          setState(() {
            index=value;
          });
          
          },
          items: const [
            Icon(Icons.text_fields),
            Icon(Icons.image_search)
          ]),
      body:Tab[index]



    );
  }
}
