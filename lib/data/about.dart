import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Hello there! This is a game where you need to find a pair for each of the pictures.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
                child: Align(
              alignment: Alignment.center,
              child: Text(
                "Rules",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            )),
            Container(
              padding: EdgeInsets.all(20),
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
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Text(
                " The final reward depends on the speed and accuracy of execution.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
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
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
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
            Text("Special thank you to Nikolay"),
          ],
        ),
      ),
    );
  }
}
