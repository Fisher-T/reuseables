import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class DefaultTheme {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        primary: const Color.fromARGB(255, 186, 104, 200),
        secondary: Colors.amberAccent,
        brightness: Brightness.dark),
    useMaterial3: true,

    //put
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        primary: const Color.fromARGB(255, 186, 104, 200),
        secondary: Colors.amberAccent,
        brightness: Brightness.light),
    useMaterial3: true,
  );
}
