import 'package:flutter/material.dart';
import 'package:vouloir/config/color_pallete.dart';

class HomePageModel extends ChangeNotifier {
  Color _containerColor = Colors.white;
  Color get getContainerColor => _containerColor;
  Color _iconColor = secColor;
  Color get getIconColor => _iconColor;
  HomePageModel();

  void changeFilterContainerColor() {
    _containerColor = secColor;
    notifyListeners();
  }

  void changeFilterIconColor() {
    _iconColor = Colors.white;
    notifyListeners();
  }

  void clearFilterDefaultColor() {
    _containerColor = Colors.white;
    notifyListeners();
  }
}
