

import 'package:flutter/material.dart';

Widget defaultButton({void Function()? onPress,required String txt, Color? shapeColor, Color? colorTxT})
{
 return ElevatedButton(
     style: ElevatedButton.styleFrom(
       backgroundColor:shapeColor,
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(32)
      )
     ),
     onPressed:onPress , child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 14),
       child: Text(txt,style: TextStyle(fontFamily: "Changa",color:colorTxT ),),
     )) ;
}

Widget defaultTextForm({bool obs=false,required String hinttxt, IconData? prefixIcon,TextInputType? type,TextEditingController?controller,String? Function(String?)? validator})
{
  return TextFormField(
    obscureText: obs,
    validator:validator ,
    keyboardType:type ,
    controller:controller ,
    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black87)
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
      ),
      hintText: hinttxt,
      prefixIcon: Icon(prefixIcon),
    ),
  );
}