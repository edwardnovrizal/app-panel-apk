import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<File?> fromFile() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
