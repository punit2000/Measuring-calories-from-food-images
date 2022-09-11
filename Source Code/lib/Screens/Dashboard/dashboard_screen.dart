import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  bool isImageLoaded = false;
  List _result;
  String _confidence = "";
  String _name = "";
  String _calorie = "";
  String _protein = "";
  String _carbs = "";
  String _fat = "";
  String numbers = "";
  int _targetcal;

  getImageFromGallery() async {
    final tempStore = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
      applyModelOnImage(File(tempStore.path));
    });
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(labels: "assets/labels.txt", model: "assets/model_unquant.tflite");
    print("Result after loading model: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(path: file.path, numResults: 2, threshold: 0.5, imageMean: 127.5, imageStd: 127.5);
    setState(() {
      _result = res;
      String str = _result[0]["label"];
      _calorie = str.substring(3, 7);
      _protein = str.substring(16, 20);
      _carbs = str.substring(8, 11);
      _fat = str.substring(12, 15);
      _name = str.substring(21);
      _targetcal = int.parse(_calorie);
      _confidence = _result != null ? (_result[0]["confidence"] * 100.0).toString().substring(0, 2) + "%" : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white, //const Color(0xFFE9E9E9),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color(0xFF6161A1),
                elevation: 6,
                child: Column(
                  children: <Widget>[
                    isImageLoaded
                        ? Center(
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(pickedImage.path)), fit: BoxFit.contain) //DecorationImage

                                  ), //BoxDecoration
                            ), // Container
                          )
                        : Container(),
                    SizedBox(
                      height: 30,
                    ),
                    isImageLoaded
                        ? Text(
                            "Food Name : $_name \n Calories: $_calorie per 100gm \n \n Carbs:  $_carbs \n Fat: $_fat \n Protiens: $_protein ",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Start by uploading an image. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                    SizedBox(height: 15),
                    isImageLoaded
                        ? Column(
                            children: [
                              _targetcal == 70
                                  ? RoundedButton(
                                      text: "Other Suggestions \n Bajra Chapati: 123 Cal \n Jowar Chapati: 49 Cal ",
                                      press: () {},
                                    )
                                  : SizedBox(height: 1),
                              _targetcal == 273
                                  ? RoundedButton(
                                      text: "Other Suggestions \n Mawa Gujiya: 300 Cal ",
                                      press: () {},
                                    )
                                  : SizedBox(height: 1),
                              RoundedButton(
                                text: "Try another image ",
                                press: () {
                                  getImageFromGallery();
                                },
                              )
                            ],
                          )
                        : RoundedButton(
                            text: "Choose an image",
                            press: () {
                              getImageFromGallery();
                            },
                          ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ), //Column
      ), //Container
    ); // SCAFFOLD
  }
}
