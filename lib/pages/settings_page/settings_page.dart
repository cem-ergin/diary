import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: buildColumn(context),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Container(height: 1, width: 1),
          title: Text(
            'Yedekleme',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.settings_ethernet,
            color: Theme.of(context).primaryColor,
          ),
          title: Text("Sadece Wi-fi uzerinden yedekle"),
        ),
        ListTile(
          leading: Container(height: 1, width: 1),
          title: Text(
            'Görünüm',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/changeThemePage");
          },
          leading: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_circle, color: Colors.transparent),
          ),
          title: Text("Tema"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/changeFontPage");
          },
          leading: FaIcon(
            FontAwesomeIcons.font,
            color: Theme.of(context).primaryColor,
          ),
          title: Text("Yazı tipi"),
        ),
        ListTile(
          leading: Container(height: 1, width: 1),
          title: Text(
            'Hesabim',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {},
          leading: FaIcon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
          title: Text("Lutfen giris yapin"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }
}
