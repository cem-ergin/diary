import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final BuildContext context;
  ImagePickerHelper({@required this.context});

  Future<String> getImageFromGallery() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      print(image.path);
      return image.path;
    } catch (e) {
      print("getImageFromGallery error: " + e.toString());
      return e.toString();
    }
  }

  Future<String> getImageFromCamera() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      print(image.path);
      return image.path;
    } catch (e) {
      print("getImageFromCamera error: " + e.toString());
      return e.toString();
    }
  }
}
