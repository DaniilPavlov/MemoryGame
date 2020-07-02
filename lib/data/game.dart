import 'package:flutter/material.dart';

import '../main.dart';
import 'data.dart';
import 'stop_watch.dart';
import 'package:flutterapp2/model/tile_model.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: <Widget>[
                pairs != noOfQuestion && points > -5
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "$points",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Points",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          GridView(
                            shrinkWrap: true,
                            physics: new NeverScrollableScrollPhysics(),
                            primary: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 0.0,
                                    maxCrossAxisExtent: 125),
                            children:
                                List.generate(gridViewTiles.length, (index) {
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
                        ],
                      )
                    : points > -5
                        ? Center(
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                            Text(
                              "$minutes : $seconds : $mills",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Time",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                              SizedBox(
                                height: 20,
                              ),
                            Text(
                              addBonus(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Points in total",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                              SizedBox(
                                height: 50,
                              ),
                            Text(
                              medal,
                              style: TextStyle(fontSize: 80),
                            ),
                            SizedBox(
                              height: 50,
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
                                      height: 80,
                                      width: 200,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text(
                                        "Back to main menu",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
                          ]))
                        : Center(
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                            Text(
                              "Try harder next time!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                              SizedBox(
                                height: 50,
                              ),
                            Text(
                              "🔎",
                              style: TextStyle(fontSize: 80),
                            ),
                              SizedBox(
                                height: 50,
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
                                      height: 80,
                                      width: 200,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text(
                                        "Back to main menu",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                )),
                          ])),
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
