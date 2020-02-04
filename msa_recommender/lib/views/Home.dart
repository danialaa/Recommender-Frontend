import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'Recommender.dart';
import 'Schedule.dart';
import 'main.dart';

class Home extends StatefulWidget {
  //final int user;

  Home({Key key/*, @required this.user*/}) : super(key: key);

  @override
  HomePage createState() => new HomePage();
}

class HomePage extends State<Home> {
  int tab = 0;

  void incrementTab(index) {
    setState(() {
      tab = index;

      switch (tab) {
        case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Schedule()),
        );
        break;

        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Recommender()),
          );
          break;

        case 3:
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  CupertinoAlertDialog(
                    title: Text("Logout!"),
                    content: Text("Are You Sure You Want To Logout?"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadPage()),
                          );
                        },
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
          );

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: Text(""),
        backgroundColor: navy,
        middle: Text(
          "Welcome, name!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 30, top: 60),
                  child: Text(
                    "ID",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).brightness == Brightness.dark ?
                          Colors.white : navy
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 30),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).brightness == Brightness.dark ?
                        Colors.white : navy
                    ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 30),
                  child: Text(
                    "GPA",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).brightness == Brightness.dark ?
                        Colors.white : navy
                    ),
                  )
                ),
                new Align (
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 200),
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
          ],
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            primaryColor: gold,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: gold))),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              title: new Text(
                'Home',
                style: TextStyle(
                    color: Color(0xFF6C5014)
                ),
              ),
              icon: Icon(
                  Icons.home,
                  color: Color(0xFF6C5014)
              ),
            ),
            BottomNavigationBarItem(
              title: new Text(
                'Schedule',
                style: TextStyle(
                    color: gold
                ),
              ),
              icon: Icon(
                Icons.edit,
                color: gold
              ),
            ),
            BottomNavigationBarItem(
              title: new Text(
                'Recommended',
                style: TextStyle(
                    color: gold
                ),
              ),
              icon: Icon(
                Icons.info,
                color: gold
              ),
            ),
            BottomNavigationBarItem(
              title: new Text(
                'Logout',
                style: TextStyle(
                    color: gold
                ),
              ),
              icon: Icon(
                Icons.exit_to_app,
                color: gold
              ),
            ),
          ],
          currentIndex: tab,
          onTap: (index) {
            incrementTab(index);
          },
        ),
      ),
    );
  }
}