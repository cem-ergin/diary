import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gunluk/pages/home_page/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomePageDrawer(),
      appBar: AppBar(
        title: Text('Anasayfa'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, "/settingsPage");
            },
          )
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/notePage"),
        child: Icon(Icons.add),
      ),
    );
  }
}
