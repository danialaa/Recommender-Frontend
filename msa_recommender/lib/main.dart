import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'LoginPage.dart';

void main() => runApp(MyApp());
List<String> courses = new List();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.deepPurple,
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

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Image.asset(
              "assets/msa_logo.jpg",
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
                    color: Colors.teal,
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
