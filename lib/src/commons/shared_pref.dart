import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/theme_config.dart';

class AppSharedPref {
  // Key constants
  static const String _themeKey = "theme";
  static const String _tokenKey = "token";

  static SharedPreferences? _prefs;

  // Inisialisasi instance SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Metode untuk cek apakah sudah diinisialisasi
  static bool _isInitialized() {
    return _prefs != null;
  }

  // Public methods for theme
  static ThemeData getTheme() {
    _ensureInitialized();
    final theme = _prefs?.getString(_themeKey) ?? "light";
    return theme == "light" ? AppTheme.light : AppTheme.dark;
  }

  static void setTheme(ThemeData themeData) {
    _ensureInitialized();
    final themeValue = themeData == AppTheme.light ? 'light' : 'dark';
    _prefs?.setString(_themeKey, themeValue);
  }

  // Public methods for token
  static String? getToken() {
    _ensureInitialized();
    return _prefs?.getString(_tokenKey);
  }

  static void setToken(String token) {
    _ensureInitialized();
    _prefs?.setString(_tokenKey, token);
  }

  static void _ensureInitialized() {
    if (!_isInitialized()) {
      throw Exception("AppSharedPref has not been initialized. Call AppSharedPref.init() before using.");
    }
  }

  static void removeToken() {
    _ensureInitialized();
    _prefs?.remove(_tokenKey);
  }
}
