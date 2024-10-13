import 'package:flutter/material.dart';

Color _customColor = Color.fromARGB(255, 223, 4, 235);
List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
     this.selectedColor = 0
  }):assert(selectedColor>=0 && selectedColor<=_colorThemes.length-1, 'Colors must be beteen 0 and ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
      );
  }
}
