import 'package:flutter/material.dart';
import 'package:flutterapp2/data/game.dart';

import 'data/data.dart';
import 'data/about.dart';
import 'data/stop_watch.dart';
import 'model/tile_model.dart';

List<TileModel> gridViewTiles = new List<TileModel>();
List<TileModel> questionPairs = new List<TileModel>();

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Home(),
        '/second': (BuildContext context) => Game(),
        '/third': (BuildContext context) => About()
      },
      debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("Do you want to exit the app?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("No"),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () => Navigator.pop(context, true),
                  )
                ]));
  }

  // ignore: missing_return
  void reStart() {
    myPairs = getPairs(gameLevel);
    print("gameLevel : $gameLevel");
    myPairs.shuffle();
    selected = true;
    gridViewTiles = myPairs;
    stopWatch();
    resetWatch();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar:
              AppBar(title: Text('Memory Game'), backgroundColor: Colors.black),
          backgroundColor: Colors.white,
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/fox.png",
                  height: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      gameLevel = "easy";
                      noOfQuestion = 5;
                      letsPlay = true;
                      reStart();
                    },
                    child: Text(
                      "Easy",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.yellowAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      gameLevel = "medium";
                      letsPlay = true;
                      noOfQuestion = 6;
                      reStart();
                    },
                    child: Text(
                      "Medium",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.yellowAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      gameLevel = "hard";
                      letsPlay = true;
                      noOfQuestion = 7;
                      reStart();
                    },
                    child: Text(
                      "Hard",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.yellowAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    child: Text(
                      "About",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.yellowAccent,
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Made by D&P"),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ));
  }
}
