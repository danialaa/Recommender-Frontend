import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/views/AddASemester.dart';
import 'main.dart';

class Semesters extends StatefulWidget {
  Semesters({Key key}) : super(key: key);

  @override
  AddSemestersState createState() => AddSemestersState();
}

class AddSemestersState extends State<Semesters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(
            'Semesters',
            style: TextStyle(color: navy),
          ),
        ),
        body: SafeArea(
            child: ListView(
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: semesters
                          .map((element) => Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          element.number.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).brightness == Brightness.dark ?
                              Colors.white : Colors.black
                          ),
                        ),
                      )
                      ).toList()
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
                  builder: (context) => AddSingleSemester()
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