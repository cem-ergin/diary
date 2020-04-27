import 'dart:typed_data';

import 'package:flutter/material.dart';

class NoteItemsProvider extends ChangeNotifier {
  List<Uint8List> _images = [];
  List<Uint8List> get images => _images;
  void addImage(Uint8List image) {
    _images.add(image);
    notifyListeners();
  }
}
