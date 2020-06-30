import 'package:flutterapp2/model/tile_model.dart';

String selectedTile = "";
int selectedIndex;
bool selected = true;
int points = 0;
bool letsPlay = false;
int isTapped = 100;
int noOfQuestion = 0;
String gameLevel = "easy";

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
  }

  return pairs;
}

List<TileModel> getQuestionPairs(String gameLevel) {
  List<TileModel> pairs = new List<TileModel>();

  TileModel tileModel = new TileModel();

  int noOfQuestion;
  if (gameLevel == "easy") {
    noOfQuestion = 5;
  } else if (gameLevel == "medium") {
    noOfQuestion = 6;
  } else if (gameLevel == "hard") {
    noOfQuestion = 7;
  }

  for (int i = 0; i < noOfQuestion * 2; i++) {
    tileModel.setImageAssetPath("assets/question.png");
    tileModel.setIsSelected(false);
    pairs.add(tileModel);
    tileModel = new TileModel();
  }

  return pairs;
}
