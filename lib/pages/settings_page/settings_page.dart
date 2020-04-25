import 'package:flutter/material.dart';
import 'package:gunluk/pages/settings_page/ui/card_view.dart';
import 'package:gunluk/pages/settings_page/ui/network_card_view.dart';
import 'package:gunluk/pages/settings_page/ui/text_view.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ayarlar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextViewSettingsPage(text: "NETWORK"),
          NetworkCardViewSettingsPage(
            txt: "Transfer files over Wi-Fi only",
          ),
          TextViewSettingsPage(text: "UI"),
          CardViewSettingsPage(
            txt: "Temayi degistir",
            fnct: () {
              Navigator.pushNamed(context, "/changeThemePage");
            },
          ),
        ],
      ),
    );
  }
}
