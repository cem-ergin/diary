import 'package:flutter/material.dart';

class TextViewSettingsPage extends StatelessWidget {
  final String text;
  const TextViewSettingsPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$text",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
