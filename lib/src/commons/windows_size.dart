import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

class SetWindowsSize {
  static Future<void> size() async {
    await DesktopWindow.setWindowSize(const Size(500, 500));
    await DesktopWindow.setMinWindowSize(const Size(400, 400));
    await DesktopWindow.setMaxWindowSize(const Size(800, 800));
  }
}
