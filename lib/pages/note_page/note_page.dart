import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gunluk/pages/note_page/ui/gallery_camera_view.dart';
import 'package:gunluk/shared/date_helper.dart';
import 'package:slider_button/slider_button.dart';

class NotePage extends StatefulWidget {
  NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController myTextController;
  @override
  void initState() {
    super.initState();
    myTextController = TextEditingController();
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
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            //title: Text('Title'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${DateHelper().getMMMMd(DateTime.now())} | ${myTextController.text.length} karakter'),
              ),
              Expanded(
                child: Container(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      //reverse: true,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 4.0),
                        child: TextField(
                          controller: myTextController,
                          onChanged: onTextChanged,
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: GalleryCameraViewNotePage(),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.text_fields),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.tshirt),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.voicemail),
                      onPressed: () {
                        showGeneralDialog(
                          barrierLabel: "Label",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 350),
                          context: context,
                          pageBuilder: (context, anim1, anim2) {
                            return Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                child: SliderButton(
                                  vibrationFlag: true,
                                  action: () {
                                    Navigator.pop(context);
                                  },
                                  label: Text(
                                    "Ses kaydi icin kaydir",
                                    style: TextStyle(
                                      color: Color(0xff4a4a4a),
                                      //fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.fiber_smart_record),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                    bottom: 50, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.9),
                                  //color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position:
                                  Tween(begin: Offset(1, 1), end: Offset(0, 0))
                                      .animate(anim1),
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTextChanged(String value) {
    setState(() {});
  }
}
