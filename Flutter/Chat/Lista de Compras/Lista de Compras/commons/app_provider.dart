
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  ThemeData theme = ThemeData.light();

  setDarkMode(ThemeData thm){
    theme = thm;
    notifyListeners();
  }
}