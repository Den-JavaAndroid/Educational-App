import 'package:edu_app/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/themes/app_dark_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeDataData();
    super.onInit();
  }

  void initializeThemeDataData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
