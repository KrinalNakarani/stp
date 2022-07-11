import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int i = 0;
  ImagePicker imagePicker = ImagePicker();
  File file = File("");
  List gn = ["Male", "Female"];
  String s_gn = "Female";
  List check = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("Edit Your Profile"),
        ),
        body: Stepper(
          currentStep: i,
          onStepTapped: (ps) {
            setState(() {
              i = ps;
            });
          },
          onStepContinue: () {
            setState(() {
              if (i < 9) {
                i++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (i > 0) {
                i--;
              }
            });
          },
          steps: [
            Step(
              title: Text(
                "Profile Picture",
                style: TextStyle(fontSize: 17),
              ),
              content: GestureDetector(
                onTap: () async {
                  XFile? f1 =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    file = File(f1!.path);
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: FileImage(file),
                  ),
                ),
              ),
            ),
            Step(
              title: Text(
                "Name",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                decoration: InputDecoration(
                  label: Text("Name"),
                ),
              ),
            ),
            Step(
              title: Text(
                "Phone Number",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Number"),
                ),
              ),
            ),
            Step(
              title: Text(
                "E-mail",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("E-mail"),
                ),
              ),
            ),
            Step(
              title: Text(
                "DOB",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  label: Text("Date Of Birth"),
                ),
              ),
            ),
            Step(
              title: Text(
                "Gender",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              content: Column(
                children: [
                  ListTile(
                    leading: Radio(
                        value: gn[0],
                        groupValue: s_gn,
                        onChanged: (dynamic value) {
                          setState(() {
                            s_gn = value as String;
                          });
                        }),
                    title: Text("Male"),
                  ),
                  ListTile(
                    leading: Radio(
                        value: gn[1],
                        groupValue: s_gn,
                        onChanged: (dynamic value) {
                          setState(() {
                            s_gn = value as String;
                          });
                        }),
                    title: Text("Female"),
                  ),
                ],
              ),
            ),
            Step(
              title: Text(
                "Curent Location",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on_outlined),
                  label: Text("Location"),
                ),
              ),
            ),
            Step(
              title: Text(
                "Nationalities",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.flag),
                  label: Text("Nationalities"),
                ),
              ),
            ),
            Step(
              title: Text(
                "Religion",
                style: TextStyle(fontSize: 17),
              ),
              content: TextField(
                decoration: InputDecoration(
                  label: Text("Religion"),
                ),
              ),
            ),
            Step(
              title: Text(
                "Languages",
                style: TextStyle(fontSize: 17),
              ),
              content: Column(
                children: [
                  ListTile(
                    leading: Checkbox(
                        value: check[0],
                        onChanged: (value) {
                          setState(() {
                            check[0] = value;
                          });
                        }),
                    title: Text("Gujarati"),
                  ),
                  ListTile(
                    leading: Checkbox(
                        value: check[1],
                        onChanged: (value) {
                          setState(() {
                            check[1] = value;
                          });
                        }),
                    title: Text("Hindi"),
                  ),
                  ListTile(
                    leading: Checkbox(
                        value: check[2],
                        onChanged: (value) {
                          setState(() {
                            check[2] = value;
                          });
                        }),
                    title: Text("English"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
