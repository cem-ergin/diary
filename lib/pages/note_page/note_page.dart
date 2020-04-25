import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gunluk/shared/date_helper.dart';

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
                    '${DateHelper().getMonthAndDay(DateTime.now())} | ${myTextController.text.length} karakter'),
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
                    child: IconButton(
                      // icon: FaIcon(FontAwesomeIcons.cameraRetro),
                      icon: Icon(Icons.photo_album),
                      onPressed: () {},
                    ),
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
                      onPressed: () {},
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
