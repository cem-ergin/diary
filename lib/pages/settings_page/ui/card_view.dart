import 'package:flutter/material.dart';

class CardViewSettingsPage extends StatelessWidget {
  final String txt;
  final Function fnct;
  const CardViewSettingsPage({Key key, @required this.txt, @required this.fnct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnct,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$txt"),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.question_answer,
                          color: Colors.transparent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.question_answer,
                          color: Colors.transparent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child:
                          Icon(Icons.check_circle, color: Colors.transparent),
                    ),
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
