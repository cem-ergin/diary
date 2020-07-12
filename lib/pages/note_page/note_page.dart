import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gunluk/constants/google_text_themes.dart';
import 'package:gunluk/constants/my_themes.dart';
import 'package:gunluk/helpers/dialog_helper.dart';
import 'package:gunluk/helpers/image_picker_helper.dart';
import 'package:gunluk/pages/note_page/ui/gallery_camera_view.dart';
import 'package:gunluk/pages/note_page/ui/show_image.dart';
import 'package:gunluk/providers/diary_provider.dart';
import 'package:gunluk/shared/date_helper.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _myTextController = TextEditingController();
  DiaryProvider _listenFalseDiaryProvider;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _listenFalseDiaryProvider =
        Provider.of<DiaryProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final DiaryProvider _diaryProvider = Provider.of<DiaryProvider>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            print("burasi calisiyor mu?");
            _listenFalseDiaryProvider.clearAll();
            Navigator.pop(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: buildAppBar(_diaryProvider),
            body: Container(
              decoration: BoxDecoration(
                color: _diaryProvider.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTextField(_diaryProvider),
                  buildImageSection(_diaryProvider),
                  buildBottomSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildImageSection(DiaryProvider _diaryProvider) {
    return Container(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _diaryProvider.imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onImagePressed(File(_diaryProvider.imagePaths[index])),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Hero(
                tag: _diaryProvider.imagePaths[index]
                    .substring(_diaryProvider.imagePaths[index].length - 5),
                child: Image(
                  height: 80,
                  width: 60,
                  fit: BoxFit.fitHeight,
                  image: FileImage(
                    File(_diaryProvider.imagePaths[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onImagePressed(File _imageFile) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ShowImagePage(imageFile: _imageFile)));
  }

  AppBar buildAppBar(DiaryProvider _diaryProvider) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData().copyWith(color: Colors.black),
      title: buildDateAndLengthView(_diaryProvider),
      backgroundColor: _diaryProvider.backgroundColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Expanded buildTextField(DiaryProvider _diaryProvider) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Container(
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                child: TextField(
                  style: _diaryProvider.textTheme.bodyText1,
                  focusNode: _focusNode,
                  controller: _myTextController,
                  onChanged: onTextChanged,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.justify,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Yazmaya baslayabilirsin',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDateAndLengthView(DiaryProvider _diaryProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${DateHelper().getMMMMd(DateTime.now())} | ${_myTextController.text.trim().length} karakter',
        style: _diaryProvider.textTheme.bodyText1,
      ),
    );
  }

  Row buildBottomSection() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildGalleryCameraButton(),
        buildFontButton(),
        buildThemeButton(),
        buildRecordButton(),
        buildMoreButton(),
      ],
    );
  }

  Expanded buildRecordButton() {
    return Expanded(
      child: IconButton(
        icon: FaIcon(FontAwesomeIcons.voicemail),
        onPressed: () =>
            DialogHelper(context: context, text: "Ses kaydi yapilamiyor"),
      ),
    );
  }

  Expanded buildThemeButton() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.color_lens),
        onPressed: _onThemeButtonPressed,
      ),
    );
  }

  void _onThemeButtonPressed() {
    final _myThemes = MyThemes.myThemes();
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: buildColorsContainer(_myThemes),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded buildFontButton() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.font_download),
        onPressed: _showFontDraggableScrollableSheet,
      ),
    );
  }

  void _showFontDraggableScrollableSheet() {
    List<TextTheme> _myTextThemes = MyGoogleTextThemes.getMyTextThemes();
    List<String> _myTextThemeNames = MyGoogleTextThemes.getMyTextThemeStrings();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.25,
          expand: false,
          maxChildSize: 0.4,
          minChildSize: 0.1,
          builder: (BuildContext context, ScrollController scrollController) {
            return ListView.separated(
              controller: scrollController,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: _myTextThemes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () =>
                      onChangeFontPressed(context, _myTextThemes[index]),
                  title: Text(
                    "Pijamalı hasta yağız şoföre çabucak güvendi, 1234567890.",
                    style: _myTextThemes[index].bodyText1,
                  ),
                  subtitle: Text(
                    "${_myTextThemeNames[index]}",
                    style: _myTextThemes[index].bodyText1,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void onChangeFontPressed(BuildContext context, TextTheme _textTheme) {
    Provider.of<DiaryProvider>(context, listen: false)
        .changeTextTheme(_textTheme);
  }

  Expanded buildGalleryCameraButton() {
    return Expanded(
      child: GalleryCameraViewNotePage(),
    );
  }

  Expanded buildMoreButton() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: _onMoreButtonPressed,
      ),
    );
  }

  void _onMoreButtonPressed() {
    final _myThemes = MyThemes.myThemes();
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Sil"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Paylaş"),
                  ),
                  ListTile(
                    onTap: _showFontDraggableScrollableSheet,
                    leading: Icon(
                      Icons.font_download,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Yazı tipini değiştir"),
                  ),
                  ListTile(
                    onTap: () => _onGalleryPressed(context),
                    leading: Icon(
                      Icons.photo,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Albümden fotoğraf ekle"),
                  ),
                  ListTile(
                    onTap: () => _onCameraPressed(context),
                    leading: Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Kameradan fotoğraf ekle"),
                  ),
                  ListTile(
                    onTap: () => DialogHelper(
                        context: context, text: "Ses kaydi eklenemiyor"),
                    leading: Icon(
                      Icons.keyboard_voice,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Ses kaydı ekle"),
                  ),
                  ListTile(
                    onTap: () => DialogHelper(
                        context: context, text: "Ses kaydi yapilamiyor"),
                    leading: Icon(
                      Icons.voicemail,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text("Anlık ses kaydet"),
                  ),
                  buildColorsContainer(_myThemes),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGalleryPressed(BuildContext context) async {
    String imagePath =
        await ImagePickerHelper(context: context).getImageFromGallery();
    _listenFalseDiaryProvider.addImage(imagePath);
    Navigator.pop(context);
  }

  Future<void> _onCameraPressed(BuildContext context) async {
    String imagePath =
        await ImagePickerHelper(context: context).getImageFromCamera();
    _listenFalseDiaryProvider.addImage(imagePath);
    Navigator.pop(context);
  }

  Container buildColorsContainer(List<ThemeData> _myThemes) {
    return Container(
      height: 48,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _myThemes.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 2.0,
              bottom: 8.0,
            ),
            child: InkWell(
              onTap: () => onColorPresed(_myThemes[index].primaryColor),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: _myThemes[index].primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }

  void onColorPresed(Color c) {
    _listenFalseDiaryProvider.setColor(c);
  }

  void onTextChanged(String value) {
    setState(() {});
  }
}
