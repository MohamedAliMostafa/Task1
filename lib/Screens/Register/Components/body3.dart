import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Components/Compo.dart';
import '../../../Constants.dart';
import '../../Login/Login.dart';

class Body3 extends StatelessWidget {

  bool emptyArea=true;
  @override
  Widget build(BuildContext context) {
    var conName=TextEditingController();
    var conemail=TextEditingController();
    var conpass=TextEditingController();

    var ke=GlobalKey<FormState>();
    return Form(
      key: ke,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Register Now!",style: TextStyle(fontFamily: "Changa",fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("Create an Account,it's Free",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Changa",fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w600)),
            const SizedBox(height: 20,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child:Column(
                  children: [
                    defaultTextForm(hinttxt: "UserName",prefixIcon: Icons.person,type: TextInputType.name,controller:conName,validator: (p0) {
                      if(p0!.isEmpty)
                        {
                          return "Requried Field";
                        }
                    }, ),
                    const SizedBox(height: 20,),
                    defaultTextForm(hinttxt: "Email",prefixIcon: Icons.email,type: TextInputType.emailAddress,controller:conemail,validator: (p0) {
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
                    },),
                    const SizedBox(height: 20,),
                    defaultTextForm(hinttxt: "Password",prefixIcon: Icons.password,type: TextInputType.visiblePassword,controller:conpass,validator: (p0) {
                      if(p0!.isEmpty)
                      {
                        return "Requried Field";
                      }
                    },obs: true ),
                  ],
                )
            ),
            const SizedBox(height: 40,),
            defaultButton(txt: reg,shapeColor:const Color(0xff061a52),colorTxT: Colors.white,onPress: () async {
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
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: conemail.text,
                        password: conpass.text,
                      );
                      Navigator.pushReplacementNamed(context, Login.RouteName);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }

            }, ),
            const Text("Already have an account ?",style: TextStyle(color: Colors.black,fontSize: 15),),
            InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, Login.RouteName),
                child: Text(log,style: const TextStyle(fontSize: 18,fontFamily: "Changa",fontWeight: FontWeight.bold),))

          ],
        ),
      ),
    );
  }
}
