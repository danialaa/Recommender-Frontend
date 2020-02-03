import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/models/Major.dart';
import 'SemestersPage.dart';
import 'main.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  final _sid = TextEditingController(),
      _gpa = TextEditingController(),
      _name = TextEditingController();

  String currentMajor = Major.Arts_and_Design.name;
  int selected = 0;
  List<String> majors = [Major.Arts_and_Design.name,
                         Major.Bio_Technology.name,
                         Major.Computer_Science.name,
                         Major.Dentistry.name,
                         Major.Engineering.name,
                         Major.Languages.name,
                         Major.Management.name,
                         Major.Mass_Communication.name,
                         Major.Pharmacy.name];

  @override
  void dispose() {
    super.dispose();
    _sid.dispose();
    _gpa.dispose();
    _name.dispose();
  }

  Widget buildPicker() {
    return CupertinoPicker(
        itemExtent: 50,
        backgroundColor: CupertinoColors.white,
        onSelectedItemChanged: (index) {
          setState(() {
            selected = index;
            currentMajor = majors[index];
          });
        },
        children: List<Widget>.generate(
          majors.length,
              (index) {
            return Center(
              child: Text(
                majors[index],
                style: TextStyle(fontSize: 18, color: gold),
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(
            'Login',
            style: TextStyle(color: navy),
          ),
        ),
        body: SafeArea(
            child: ListView(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "Fill Information As Required",
                      style: TextStyle(
                        fontSize: 20,
                        color: gold,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
                    child: CupertinoTextField(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark ?
                          Colors.white : Colors.black
                      ),
                      placeholder: "Student ID",
                      controller: _sid,
                      keyboardType: TextInputType.number,
                      prefix: Icon(
                        Icons.credit_card,
                        color: gold,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: CupertinoTextField(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark ?
                          Colors.white : Colors.black
                      ),
                      placeholder: "Student Name",
                      controller: _name,
                      prefix: Icon(
                        Icons.person,
                        color: gold,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: CupertinoTextField(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark ?
                          Colors.white : Colors.black
                      ),
                      placeholder: "GPA",
                      controller: _gpa,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                      ),
                      prefix: Icon(
                        Icons.school,
                        color: gold,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Text(
                          "Major",
                          style: TextStyle(fontSize: 16, color: navy),
                        ),
                        new Expanded(
                            child: Align (
                              alignment: FractionalOffset.centerRight,
                              child: CupertinoButton(
                                onPressed: () async {
                                  await showModalBottomSheet<int>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return buildPicker();
                                    },
                                  );
                                },
                                child: Text(
                                  majors[selected],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: gold,
                                  ),
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          minSize: 35,
                          padding: EdgeInsets.all(0),
                          color: navy,
                          child: Text(
                            'Add Semesters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semesters()
                                )
                            );
                          }),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(25, 60, 25, 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          minSize: 35,
                          padding: EdgeInsets.all(0),
                          color: navy,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            if (_sid.text.isEmpty ||
                                _gpa.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                        title: Text("Oops!"),
                                        content: Text(
                                            "Please fill all required information"),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            isDefaultAction: true,
                                            child: Text("Got it"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ));
                            } else {
                              //CHECK LW ELCOUNTER BTA3 COURSES >=4
                            }
                          }),
                    ),
                  ),
                  new Align (
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Text(
                          "Already made this step?",
                          style: TextStyle(
                            color: gold
                          )
                        )
                      )
                  ),
                  new Align (
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Image.asset(
                        "assets/msa_logo.png",
                        width: 140,
                        height: 140,
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        colorBlendMode: BlendMode.modulate,
                      ),
                    )
                  ),
                ],
              )
            ])
        )
    );
  }
}