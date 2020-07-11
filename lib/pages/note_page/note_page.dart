import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gunluk/constants/my_themes.dart';
import 'package:gunluk/pages/note_page/ui/gallery_camera_view.dart';
import 'package:gunluk/shared/date_helper.dart';
import 'package:slider_button/slider_button.dart';

class NotePage extends StatefulWidget {
  NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _myTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 100,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            //title: Text('Title'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDateAndLengthView(),
              Expanded(
                child: GestureDetector(
                  onTap: () => _focusNode.requestFocus(),
                  child: Container(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 4.0),
                          child: TextField(
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
              ),
              buildBottomSection()
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDateAndLengthView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          '${DateHelper().getMMMMd(DateTime.now())} | ${_myTextController.text.length} karakter'),
    );
  }

  Row buildBottomSection() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildGalleryCameraButton(),
        buildTextFieldButton(),
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
        onPressed: () {},
      ),
    );
  }

  Expanded buildThemeButton() {
    return Expanded(
      child: IconButton(
        icon: FaIcon(FontAwesomeIcons.tshirt),
        onPressed: () {},
      ),
    );
  }

  Expanded buildTextFieldButton() {
    return Expanded(
      child: IconButton(
        icon: Icon(Icons.text_fields),
        onPressed: () {},
      ),
    );
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text("Delete"),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.share),
                    label: Text("Share"),
                    onPressed: () {},
                  ),
                  // FlatButton.icon(
                  //   icon: Icon(Icons.font_download),
                  //   label: Text("Change font"),
                  //   onPressed: () {},
                  // ),
                  // FlatButton.icon(
                  //   icon: Icon(Icons.photo),
                  //   label: Text("Add photo"),
                  //   onPressed: () {},
                  // ),
                  // FlatButton.icon(
                  //   icon: Icon(Icons.keyboard_voice),
                  //   label: Text("Record voice"),
                  //   onPressed: () {},
                  // ),
                  Container(
                    height: 40,
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
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: _myThemes[index].primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onTextChanged(String value) {
    setState(() {});
  }
}
