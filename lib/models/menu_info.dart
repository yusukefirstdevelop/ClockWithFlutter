// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:uitraining/enums.dart';

// class MenuInfo extends ChangeNotifier {
//   MenuType menuType;
//   String title;
//   String imageSource;

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageSource;
  // MenuInfo({MenuType? menuType,this.title, this.imageSource);
  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

//Important
    notifyListeners();
  }
}
