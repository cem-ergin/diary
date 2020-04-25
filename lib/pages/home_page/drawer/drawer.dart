import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: RaisedButton(
        child: Text('take note'),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/notePage');
        },
      ),
    );
  }
}
