import 'package:flutter/material.dart';

import 'data/data.dart';
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

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info"), backgroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            SizedBox(
              child: Text(
                "Hello there! This is a game where you need to find a pair for each of the pictures.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rules:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            )),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Text(
                "At the beginning, you have 5 seconds to remember the "
                "location of all the pictures. Next, the pictures are hidden and the game begins. "
                "For each correct pair you get 5 points, for each incorrect pair you get -2 point. "
                "As soon as you collect all the pairs or score -5 points, the game is over for you.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
                child: Center(
              child: Text(
                "I hope you will enjoy it!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
            )),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                child: Center(
                    child: Text(
              " 🚀",
              style: TextStyle(fontSize: 80),
            ))),
          ])),
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
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          Navigator.pop(context, true);
          letsPlay = false;
          pairs = 0;
          points = 0;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(''),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$points",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Points",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "$minutes : $seconds : $mills",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Time",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                pairs != noOfQuestion && points > -5
                    ? GridView(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        primary: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 0.0, maxCrossAxisExtent: 125),
                        children: List.generate(gridViewTiles.length, (index) {
                          if (letsPlay) {
                            delay();
                          }
                          return Tile(
                            imagePathUrl:
                                gridViewTiles[index].getImageAssetUrl(),
                            tileIndex: index,
                            parent: this,
                          );
                        }),
                      )
                    : Center(
                        child: Column(children: <Widget>[
                        Text(
                          "🦊",
                          style: TextStyle(fontSize: 80),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              pairs = 0;
                              points = 0;
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 200,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    "Replay",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            )),
                      ]))
              ],
            ),
          ),
        ));
  }

  void delay() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        questionPairs = getQuestionPairs(gameLevel);
        gridViewTiles = questionPairs;
        selected = false;
        letsPlay = false;
        startWatch();
      });
    });
  }
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

class Tile extends StatefulWidget {
  final String imagePathUrl;
  final int tileIndex;
  final _GameState parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "" && widget.tileIndex != isTapped) {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetUrl()) {
              isTapped = 100;
              pairs = pairs + 1;
              points = points + 5;
              isCorrect = false;
              print(selectedTile +
                  " and " +
                  myPairs[widget.tileIndex].getImageAssetUrl());
              print(selectedIndex);
              print(widget.tileIndex);
              print("CORRECT");
              TileModel tileModel = new TileModel();
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                selected = false;
                selectedTile = "";
              });
            } else if (myPairs[widget.tileIndex].getImageAssetUrl() != "") {
              isTapped = 100;
              isCorrect = false;
              points = points - 2;
              print(selectedTile +
                  " and " +
                  myPairs[widget.tileIndex].getImageAssetUrl());
              print(selectedIndex);
              print(widget.tileIndex);
              print("---WRONG---");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                selected = false;
              });

              selectedTile = "";
            } else
              isCorrect = true;
          } else if (!isCorrect) {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetUrl();
              selectedIndex = widget.tileIndex;
            });
            isTapped = selectedIndex;
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetUrl() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetUrl()
                : widget.imagePathUrl)
            : Container(
                child: Image.asset("assets/correct.png"),
              ),
      ),
    );
  }
}
