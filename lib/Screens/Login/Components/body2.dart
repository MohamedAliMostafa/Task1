import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task1/Screens/Home/Home.dart';

import '../../../Components/Compo.dart';
import '../../../Constants.dart';
import '../../Register/Register.dart';

class Body2 extends StatelessWidget {
  bool emptyArea=true;

  @override
  Widget build(BuildContext context) {
    var con1=TextEditingController();
    var con2=TextEditingController();
    var ke=GlobalKey<FormState>();
    return  Form(
      key: ke,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Text(log,style: const TextStyle(fontFamily: "Changa",fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),),
            Text(txtLog,textAlign: TextAlign.center,style: const TextStyle(fontFamily: "Changa",fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w600),maxLines: 2,),
            const SizedBox(height: 20,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child:Column(
                  children: [
                    defaultTextForm(hinttxt: "Email",prefixIcon: Icons.email,type: TextInputType.emailAddress,controller:con1,validator: (p0) {
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(p0!);
                      if(p0.isEmpty)
                      {
                        return "Requried Field";
                      }
                      if(!emailValid)
                      {
                        return "email vaild";
                      }
                      return null;
                    }, ),
                    const SizedBox(height: 20,),
                    defaultTextForm(hinttxt: "Password",prefixIcon: Icons.password,type: TextInputType.visiblePassword,controller:con2 ,validator: (p0) {
                      if(p0!.isEmpty)
                      {
                        return "Requried Field";
                      }
                    },obs: true),
                  ],
                )
            ),
            const SizedBox(height: 40,),
            defaultButton(txt: "Login",shapeColor:const Color(0xff061a52),colorTxT: Colors.white,onPress: () async {
              if(ke.currentState!.validate())
                {
                  emptyArea=false;
                }
              if(emptyArea==false)
              {
                const snackBar = SnackBar(
                  backgroundColor: Colors.black87,
                  content: Text('Loading'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: con1.text,
                      password: con2.text
                  );
                  Navigator.pushReplacementNamed(context, Home.RouteNAME);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }
            }, ),
            Text(hav,style: const TextStyle(color: Colors.black,fontSize: 15),),
            InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, Register.RouteName),
                child: Text(reg,style: const TextStyle(fontSize: 18,fontFamily: "Changa",fontWeight: FontWeight.bold),))

          ],
        ),
      ),
    );
  }
}
