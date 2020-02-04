import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/models/Semester.dart';
import 'CoursesPage.dart';
import 'main.dart';

class AddSingleSemester extends StatefulWidget {
  final String editType;

  AddSingleSemester({Key key, @required this.editType}) : super(key: key);

  @override
  AddSingleSemesterPage createState() => AddSingleSemesterPage();
}

class AddSingleSemesterPage extends State<AddSingleSemester> {
  int semNumber = 1, crdtHours = 8;
  Semester semester = new Semester();
  String header = "";

  @override
  void initState() {
    super.initState();
    
    if(widget.editType == "add") {
      header = "Add Semester";
    } else {
      header = "Edit Semester";
      semester = semesters[int.parse(widget.editType)];
      semNumber = semester.number;
      crdtHours = semester.totalCredits;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(
            header,
            style: TextStyle(color: navy),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              new ListTile(
                  title: Text("Semester Number"),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(20),
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                          heroTag: "btn1num",
                          backgroundColor: gold,
                          mini: true,
                          child: Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (semNumber > 1) {
                                semNumber--;
                              }
                            });
                          },
                        ),
                      ),
                      new Text(
                        semNumber.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                      new Container(
                        margin: EdgeInsets.all(20),
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                          heroTag: "btn2num",
                          backgroundColor: gold,
                          mini: true,
                          child: Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              semNumber++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
              ),
              new Divider(
                height: 1,
                indent: 20,
              ),
              new ListTile(
                  title: Text("Credit Hours"),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.all(20),
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                          heroTag: "btn1hrs",
                          backgroundColor: gold,
                          mini: true,
                          child: Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (crdtHours > 8) {
                                crdtHours--;
                              }
                            });
                          },
                        ),
                      ),
                      new Text(
                        crdtHours.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                      new Container(
                        margin: EdgeInsets.all(20),
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                          heroTag: "btn2hrs",
                          backgroundColor: gold,
                          mini: true,
                          child: Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              crdtHours++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
              ),
              new Divider(
                height: 1,
                indent: 20,
              ),
              new ListTile(
                title: Text("Courses"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: navy,
                ),
                onTap: () {
                  bool isExist = false;

                  semesters.forEach((sem) => {
                    if(sem.number == semNumber && (semesters.contains(semester) && semesters.indexOf(sem) != int.parse(widget.editType))) {
                      isExist = true,

                      showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CupertinoAlertDialog(
                            title: Text("Oops!"),
                            content: Text(
                                "There's Already a Semester With the Same Number"),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: Text("Got it"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          )
                      )
                    }
                  });

                  if(!isExist) {
                    semester.number = semNumber;
                    semester.totalCredits = crdtHours;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Courses(semester: semester,)
                        )
                    );
                  }
                },
              ),
              new Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 100),
                child: CupertinoButton(
                    child: Text("Add"),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    minSize: 35,
                    padding: EdgeInsets.all(0),
                    color: navy,
                    onPressed: () {
                      setState(() {

                      });
                    }
                ),
              )
            ],
          )
        )
    );
  }
}
