import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowImagePage extends StatefulWidget {
  final File imageFile;
  ShowImagePage({Key key, @required this.imageFile}) : super(key: key);

  @override
  _ShowImagePageState createState() => _ShowImagePageState();
}

class _ShowImagePageState extends State<ShowImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  PhotoView buildBody() {
    return PhotoView(
      heroAttributes: PhotoViewHeroAttributes(
          tag:
              "${widget.imageFile.path.substring(widget.imageFile.path.length - 5)}"),
      imageProvider: FileImage(widget.imageFile),
      maxScale: PhotoViewComputedScale.contained * 3,
      minScale: PhotoViewComputedScale.contained * 0.9,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.file(
              "Gunluk uygulamamdan paylasim",
              "gunluk.jpg",
              widget.imageFile.readAsBytesSync(),
              "image/jpg",
            );
          },
        ),
      ],
    );
  }
}
