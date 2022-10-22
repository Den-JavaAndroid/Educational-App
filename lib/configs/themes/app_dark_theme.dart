import 'dart:ui';

import 'package:edu_app/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColorDark = Color(0xFF2ec362);
const Color primaryColorDark = Color(0xFF99ace1);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes()
            .apply(bodyColor: primaryColorDark, displayColor: primaryColorDark));
  }
}