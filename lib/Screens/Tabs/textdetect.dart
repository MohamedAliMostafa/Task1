import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class TextDetection extends StatefulWidget {
  @override
  State<TextDetection> createState() => _TextDetectionState();
}

class _TextDetectionState extends State<TextDetection> {
  String textRec="";

  bool textScan=false ;

  XFile? imagefile;

  void getImage(ImageSource source)async
  {
    try {
      final pickimage = await ImagePicker().pickImage(source: source);
      if (pickimage != null) {
        textScan = true;
        imagefile = pickimage;
        setState(() {
          getTextRec(pickimage);
        });
      }
    }
    catch(e)
    {
      textScan = false;
      imagefile = null;
      setState(() {
        textRec="ERROR Occure while scanning";
      });

    }
  }

  void getTextRec(XFile image)async
  {
    final inputImage=InputImage.fromFilePath(image.path);
    final textDetector=GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText=await textDetector.processImage(inputImage);
    await textDetector.close();
    textRec="";
    for(TextBlock block in recognizedText.blocks)
    {
      for(TextLine textLine in block.lines)
      {
        textRec='$textRec${textLine.text}\n';
      }
    }
    textScan=false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Detection"),centerTitle: true,),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         imagefile==null? Container(
           width: 200,
           height: 200,
          decoration: BoxDecoration(
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
              padding: const EdgeInsets.all(20),
              height: 100,
                child: ListView(
                  children: [
                    Text(textRec,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ],
                ),
              )
        ],
      ),
    );
  }
}
