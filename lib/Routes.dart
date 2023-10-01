import 'package:flutter/material.dart';
import 'package:task1/Screens/Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/Screens/Splach.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:Splash.RouteNAME ,
          routes: {
            Splash.RouteNAME:(context)=>Splash(),
            Home.RouteNAME:(context)=>Home(),

          },
        );
      },

    );

  }
}