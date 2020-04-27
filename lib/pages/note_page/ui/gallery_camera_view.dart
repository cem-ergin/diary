import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryCameraViewNotePage extends StatelessWidget {
  const GalleryCameraViewNotePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.photo_album),
      onPressed: () {
        showGeneralDialog(
          barrierLabel: "Label",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 350),
          context: context,
          pageBuilder: (context, anim1, anim2) {
            return Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          textColor: Theme.of(context).canvasColor,
                          child: Text("Gallery"),
                          onPressed: () {
                            onGalleryPressed(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlineButton(
                          textColor: Theme.of(context).canvasColor,
                          child: Text("Camera"),
                          onPressed: () {
                            onCameraPressed(context);
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            );
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position:
                  Tween(begin: Offset(-1, 1), end: Offset(0, 0)).animate(anim1),
              child: child,
            );
          },
        );
      },
    );
  }

  Future<void> onGalleryPressed(BuildContext context) async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      print(image.path);
      Navigator.pop(context);
    } catch (e) {
      print("error: " + e.toString());
    }
  }

  Future<void> onCameraPressed(BuildContext context) async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      print(image.path);
      Navigator.pop(context);
    } catch (e) {
      print("error: " + e.toString());
    }
  }
}
