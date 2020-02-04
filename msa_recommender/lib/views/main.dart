import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:msa_recommender/models/Grade.dart';
import 'package:msa_recommender/models/Semester.dart';
import 'package:msa_recommender/models/Course.dart';
import 'LoginPage.dart';

void main() => runApp(MyApp());

List<Semester> semesters = new List();
final Map<int, Color> navySwatch = {
  50:  Color.fromRGBO(13, 27, 69, 0.1),
  100: Color.fromRGBO(13, 27, 69, 0.2),
  200: Color.fromRGBO(13, 27, 69, 0.3),
  300: Color.fromRGBO(13, 27, 69, 0.4),
  400: Color.fromRGBO(13, 27, 69, 0.5),
  500: Color.fromRGBO(13, 27, 69, 0.6),
  600: Color.fromRGBO(13, 27, 69, 0.7),
  700: Color.fromRGBO(13, 27, 69, 0.8),
  800: Color.fromRGBO(13, 27, 69, 0.9),
  900: Color.fromRGBO(13, 27, 69, 1.0),
};
final Map<int, Color> goldSwatch = {
  50:  Color.fromRGBO(197, 147, 36, 0.1),
  100: Color.fromRGBO(197, 147, 36, 0.2),
  200: Color.fromRGBO(197, 147, 36, 0.3),
  300: Color.fromRGBO(197, 147, 36, 0.4),
  400: Color.fromRGBO(197, 147, 36, 0.5),
  500: Color.fromRGBO(197, 147, 36, 0.6),
  600: Color.fromRGBO(197, 147, 36, 0.7),
  700: Color.fromRGBO(197, 147, 36, 0.8),
  800: Color.fromRGBO(197, 147, 36, 0.9),
  900: Color.fromRGBO(197, 147, 36, 1.0),
};
MaterialColor navy = MaterialColor(0xFF0d1b45, navySwatch);
MaterialColor gold = MaterialColor(0xFFc59324, goldSwatch);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: navy,
        accentColor: gold,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'MSA Recommender',
          theme: theme,
          home: LoadPage(),
        );
      },
    );
  }
}

void addTemp() {
  Course course = new Course("CS213", Grade.A, 3);
  Course course2 = new Course("CS232", Grade.A_minus, 3);
  List<Course> courses = new List();
  courses.add(course);
  courses.add(course2);
  Semester sem = new Semester(1, 18, courses);
  semesters.add(sem);
  Semester sem2 = new Semester(2, 36, courses);
  semesters.add(sem2);
}

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();

    addTemp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: Center(
        child: Column(children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Image.asset(
              "assets/mrs.png",
              width: 300,
              height: 300,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CupertinoButton(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: gold,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()
                      )
                  );
                },
              ),
            ],
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
