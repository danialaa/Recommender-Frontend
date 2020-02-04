import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/models/Semester.dart';
import 'package:msa_recommender/views/AddACourse.dart';
import 'main.dart';

class Courses extends StatefulWidget {
  final Semester semester;

  Courses({Key key, @required this.semester}) : super(key: key);

  @override
  CoursesState createState() => CoursesState();
}

class CoursesState extends State<Courses> {
  List<Widget> buildCourses() {
    if(widget.semester.courses == null) {
      return <Widget>[
        Text(
          '\n \n \n No Courses Yet',
          style: TextStyle(
            fontSize: 20,
            color: gold
          ),
        )
      ];
    } else {
      return widget.semester.courses.map((element) => Column(
        children: <Widget>[
          new ListTile(
            title: Padding (
              padding: EdgeInsets.only(left: 10),
              child: Text(
                element.id.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.dark ?
                    Colors.white : Colors.black
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Theme.of(context).brightness == Brightness.dark ?
              Colors.white : Colors.black,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddSingleCourse(editType:
                          semesters.indexOf(widget.semester).toString() + "," +
                          widget.semester.courses.indexOf(element).toString(),
                      )
                  )
              );
            },
          ),
          new Padding(
            padding: EdgeInsets.only(left: 20),
            child: Divider(
              height: 1,
            ),
          )
        ],
      )).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(
            'Courses',
            style: TextStyle(color: navy),
          ),
        ),
        body: SafeArea(
            child: ListView(
                children: <Widget>[
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildCourses()
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(20, 80, 20, 30),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          minSize: 35,
                          padding: EdgeInsets.all(0),
                          color: navy,
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }
                      ),
                    ),
                  ),
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: gold,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddSingleCourse(editType: "add",)
              )
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}