import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/models/Grade.dart';
import 'package:msa_recommender/models/Course.dart';
import 'main.dart';

class AddSingleCourse extends StatefulWidget {
  final String editType;

  AddSingleCourse({Key key, @required this.editType}) : super(key: key);

  @override
  AddSingleCoursePage createState() => AddSingleCoursePage();
}

class AddSingleCoursePage extends State<AddSingleCourse> {
  String id = "", currentGrade = Grade.A.text;
  int selected = 0, crdtHours = 2;
  Course course = new Course();
  String header = "";
  final _cid = TextEditingController();
  List<String> grades = [Grade.A.text,
                         Grade.A_minus.text,
                         Grade.B_plus.text,
                         Grade.B.text,
                         Grade.B_minus.text,
                         Grade.C_plus.text,
                         Grade.C.text,
                         Grade.C_minus.text,
                         Grade.D_plus.text,
                         Grade.D.text,
                         Grade.F1.text,
                         Grade.F2.text,
                         Grade.F3.text,];

  Widget buildPicker() {
    return CupertinoPicker(
        itemExtent: 50,
        backgroundColor: Theme.of(context).brightness == Brightness.dark ?
                          CupertinoColors.white : CupertinoColors.black,
        onSelectedItemChanged: (index) {
          setState(() {
            selected = index;
            currentGrade = grades[index];
          });
        },
        children: List<Widget>.generate(
          grades.length,
              (index) {
            return Center(
              child: Text(
                grades[index],
                style: TextStyle(fontSize: 18, color: gold),
              ),
            );
          },
        )
    );
  }

  @override
  void initState() {
    super.initState();
    
    if(widget.editType == "add") {
      header = "Add Course";
    } else {
      header = "Edit Course";
      course = semesters[int.parse(widget.editType.split(",").first)]
                        .courses[int.parse(widget.editType.split(",").last)];
      id = course.id;
      currentGrade = course.grade.text;
      selected = grades.indexOf(currentGrade);
      _cid.text = id;
      crdtHours = course.creditHours;
    }
  }
  
  @override
  void dispose() {
    super.dispose();
    _cid.dispose();
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
                  title: CupertinoTextField(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).brightness == Brightness.dark ?
                        Colors.white : Colors.black
                    ),
                    placeholder: "Course ID",
                    controller: _cid,
                    prefix: Icon(
                      Icons.credit_card,
                      color: gold,
                    ),
                  ),
              ),
              new Divider(
                height: 1,
                indent: 20,
              ),
              new ListTile(
                  title: new Text(
                    "Major",
                    style: TextStyle(fontSize: 16, color: navy),
                  ),
                  trailing: CupertinoButton(
                    onPressed: () async {
                      await showModalBottomSheet<int>(
                        context: context,
                        builder: (BuildContext context) {
                          return buildPicker();
                        },
                      );
                    },
                    child: Text(
                      grades[selected],
                      style: TextStyle(
                        fontSize: 16,
                        color: gold,
                      ),
                    ),
                  ),
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
                              if (crdtHours > 2) {
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
                            color: Theme.of(context).brightness == Brightness.dark ?
                                    Colors.white: Colors.black),
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
                              crdtHours++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
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
