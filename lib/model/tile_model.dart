class TileModel {
  String imageAssetUrl;
  bool isSelected;

  TileModel({this.imageAssetUrl, this.isSelected});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetUrl = getImageAssetPath;
  }

  String getImageAssetUrl() {
    return imageAssetUrl;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  bool getIsSelected() {
    return isSelected;
  }
}
