import 'package:flutterapp2/data/stop_watch.dart';
import 'package:flutterapp2/model/tile_model.dart';

String selectedTile = "";
int selectedIndex;
bool selected = true;
int pairs = 0;
int points = 0;
int bonus;
bool letsPlay = false;
int isTapped = 100;
int noOfQuestion = 0;
String gameLevel = "easy";
String medal = "🥇";

List<TileModel> myPairs = new List<TileModel>();
List<bool> clicked = new List<bool>();

List<bool> getClicked() {
  List<bool> yoClicked = new List<bool>();
  List<TileModel> myairs = new List<TileModel>();
  myairs = getPairs(gameLevel);
  for (int i = 0; i < myairs.length; i++) {
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel> getPairs(String gameLevel) {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  if (gameLevel == "easy") {
    //1
    tileModel.setImageAssetPath("assets/parrot.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //2
    tileModel.setImageAssetPath("assets/panda.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //3
    tileModel.setImageAssetPath("assets/fox.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //4
    tileModel.setImageAssetPath("assets/rabbit.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //5
    tileModel.setImageAssetPath("assets/horse.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //6
    tileModel.setImageAssetPath("assets/elephant.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }

  if (gameLevel == "medium") {
    //1
    tileModel.setImageAssetPath("assets/elephant.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //2
    tileModel.setImageAssetPath("assets/fox.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //3
    tileModel.setImageAssetPath("assets/monkey.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //4
    tileModel.setImageAssetPath("assets/panda.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //5
    tileModel.setImageAssetPath("assets/parrot.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //6
    tileModel.setImageAssetPath("assets/rabbit.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //7
    tileModel.setImageAssetPath("assets/hippo.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }

  if (gameLevel == "hard") {
    //1
    tileModel.setImageAssetPath("assets/fox.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //2
    tileModel.setImageAssetPath("assets/hippo.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //3
    tileModel.setImageAssetPath("assets/horse.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //4
    tileModel.setImageAssetPath("assets/monkey.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //5
    tileModel.setImageAssetPath("assets/panda.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //6
    tileModel.setImageAssetPath("assets/parrot.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //7
    tileModel.setImageAssetPath("assets/rabbit.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();

    //8
    tileModel.setImageAssetPath("assets/elephant.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }

  return pairs;
}

List<TileModel> getQuestionPairs(String gameLevel) {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  int noOfQuestion;
  if (gameLevel == "easy") {
    noOfQuestion = 6;
  } else if (gameLevel == "medium") {
    noOfQuestion = 7;
  } else if (gameLevel == "hard") {
    noOfQuestion = 8;
  }

  for (int i = 0; i < noOfQuestion * 2; i++) {
    tileModel.setImageAssetPath("assets/question.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }

  return pairs;
}

String addBonus() {
  if (gameLevel == "easy") {
    if ((seconds + minutes * 60) * 1000 + mills > 23000) bonus = 0;
    if ((seconds + minutes * 60) * 1000 + mills < 23000) bonus = 1;
    if ((seconds + minutes * 60) * 1000 + mills < 20000) bonus = 2;
    if ((seconds + minutes * 60) * 1000 + mills < 17000) bonus = 3;
    if (points + bonus <= 20) medal = "🥉";
    if (20 < points + bonus && points + bonus <= 25) medal = "🥈";
    if (points + bonus > 25) medal = "🥇";
  }

  if (gameLevel == "medium") {
    if ((seconds + minutes * 60) * 1000 + mills > 32000) bonus = 0;
    if ((seconds + minutes * 60) * 1000 + mills < 32000) bonus = 1;
    if ((seconds + minutes * 60) * 1000 + mills < 29000) bonus = 2;
    if ((seconds + minutes * 60) * 1000 + mills < 26000) bonus = 3;
    if ((seconds + minutes * 60) * 1000 + mills < 23000) bonus = 4;
    if ((seconds + minutes * 60) * 1000 + mills < 20000) bonus = 5;
    if (points + bonus <= 25) medal = "🥉";
    if (25 < points + bonus && points + bonus <= 30) medal = "🥈";
    if (points + bonus > 30) medal = "🥇";
  }

  if (gameLevel == "hard") {
    if ((seconds + minutes * 60) * 1000 + mills > 41000) bonus = 0;
    if ((seconds + minutes * 60) * 1000 + mills < 41000) bonus = 1;
    if ((seconds + minutes * 60) * 1000 + mills < 38000) bonus = 2;
    if ((seconds + minutes * 60) * 1000 + mills < 35000) bonus = 3;
    if ((seconds + minutes * 60) * 1000 + mills < 32000) bonus = 4;
    if ((seconds + minutes * 60) * 1000 + mills < 29000) bonus = 5;
    if ((seconds + minutes * 60) * 1000 + mills < 26000) bonus = 6;
    if ((seconds + minutes * 60) * 1000 + mills < 23000) bonus = 7;
    if (points + bonus <= 30) medal = "🥉";
    if (30 < points + bonus && points + bonus <= 35) medal = "🥈";
    if (points + bonus > 35) medal = "🥇";
  }

  return (points + bonus).toString() +
      " (in game: $points + bonus for time: $bonus)";
}
