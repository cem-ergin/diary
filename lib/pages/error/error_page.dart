import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorString;
  const ErrorPage({Key key, this.errorString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: errorString != null ? Text("$errorString") : Text("Error"),
        ),
        body: Container(
          child: Center(
            child: errorString != null ? Text("$errorString") : Text("error"),
          ),
        ),
      ),
    );
  }
}
