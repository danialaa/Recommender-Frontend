import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:msa_recommender/views/Schedule.dart';
import 'Home.dart';
import 'main.dart';

class Recommender extends StatefulWidget {
  //final int user;

  Recommender({Key key/*, @required this.user*/}) : super(key: key);

  @override
  RecommenderPage createState() => new RecommenderPage();
}

class RecommenderPage extends State<Recommender> {
  int tab = 2;

  void incrementTab(index) {
    setState(() {
      tab = index;

      switch (tab) {
        case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()),
        );
        break;

        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Schedule()),
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
          "Recommended Plan",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            new Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 30),
                child: Text(
                  "Expected \n Grade",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).brightness == Brightness.dark ?
                      Colors.white : navy
                  ),
                ),
              )
            ),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: semesters.map((element) => Column(
                  children: <Widget>[
                    new ListTile(
                      title: Padding (
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          element.number.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).brightness == Brightness.dark ?
                                      Colors.white : navy
                          ),
                        ),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          element.number.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: gold
                          ),
                        ),
                      )
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(
                        height: 1,
                      ),
                    )
                  ],
                )).toList()
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Padding(
                padding: EdgeInsets.fromLTRB(30, 220, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Text(
                      "Expected GPA",
                      style: TextStyle(fontSize: 16, color: navy),
                    ),
                    new Expanded(
                        child: Align (
                            alignment: FractionalOffset.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: Text(
                                "3.34",
                                style: TextStyle(fontSize: 18, color: gold),
                              ),
                            )
                        )
                    )
                  ],
                ),
              ),
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
                    color: gold
                ),
              ),
              icon: Icon(
                  Icons.home,
                  color: gold
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
                    color: Color(0xFF6C5014)
                ),
              ),
              icon: Icon(
                  Icons.info,
                  color: Color(0xFF6C5014)
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