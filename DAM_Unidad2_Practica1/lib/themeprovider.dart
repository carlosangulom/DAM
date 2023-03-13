import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = false;
  }

  toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}