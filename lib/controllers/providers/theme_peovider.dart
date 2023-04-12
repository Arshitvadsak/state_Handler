import 'package:flutter/material.dart';
import 'package:state_management_provider/models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel TM = ThemeModel(isDark: false);

  void changeTheme() {
    TM.isDark = !TM.isDark;
    notifyListeners();
  }
}
