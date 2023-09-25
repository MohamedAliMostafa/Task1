import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImageDetect extends StatefulWidget {
  @override
  State<ImageDetect> createState() => _ImageDetectState();
}

class _ImageDetectState extends State<ImageDetect> {
  int numOfPerson=0;
  XFile? imagefile;
  List<Face>faces=[];

  void getImage(ImageSource source)async
  {
    try {
      final pickimage = await ImagePicker().pickImage(source: source);
      if (pickimage != null) {
        imagefile = pickimage;
        setState(() {
          faceDetect(imagefile!);
        });
      }
    }
    catch(e)
    {

      imagefile = null;
      setState(() {

      });

    }
  }
  Future faceDetect(XFile img) async
  {
    final options=FaceDetectorOptions();
    final face=FaceDetector(options: options);
    var inputImage=InputImage.fromFilePath(img.path);
    faces=await face.processImage(inputImage);
    setState(() {
      numOfPerson=faces.length;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Face Detection"),centerTitle: true,),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagefile==null? Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/no-results.png"))
            ),
          ):Container(
              width: 200,
              height: 200,
              child: Image.file(File(imagefile!.path))),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                  ),
                  onPressed: (){
                    getImage(ImageSource.gallery);
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.image),
                      Text("Gallery")
                    ],
                  )),
              ElevatedButton(onPressed: (){
                getImage(ImageSource.camera);
              }, child: Column(
                children: const [
                  Icon(Icons.camera_alt),
                  Text("Camera")
                ],
              ))
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
            height: 100,
            child: Text("$numOfPerson Person",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),


          )
        ],
      ),
    );
  }
}
