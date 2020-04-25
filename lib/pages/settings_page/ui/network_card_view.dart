import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkCardViewSettingsPage extends StatefulWidget {
  final String txt;
  const NetworkCardViewSettingsPage({Key key, @required this.txt})
      : super(key: key);

  @override
  _NetworkCardViewSettingsPageState createState() =>
      _NetworkCardViewSettingsPageState();
}

class _NetworkCardViewSettingsPageState
    extends State<NetworkCardViewSettingsPage> {
  bool _switchVal;
  @override
  void initState() {
    super.initState();
    _switchVal = false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("${widget.txt}"),
            buildFutureBuilderWithSwitch(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<bool> buildFutureBuilderWithSwitch() {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Switch(
            onChanged: (val) {
              setState(() {
                _switchVal = val;
              });
              try {
                //setNetworkSharedPreferences(val);
                print("setNetworkSharedPreferences check, value: " +
                    val.toString());
              } catch (e) {
                print(
                    "there is an error on setNetworkSharedPreferences, error: " +
                        e.toString());
              }
            },
            value: snapshot.data,
          );
        }
        return Switch(
          onChanged: (val) {
            setState(() {
              _switchVal = val;
            });
            try {
              //setNetworkSharedPreferences(val);
              print("setNetworkSharedPreferences check, value: " +
                  val.toString());
            } catch (e) {
              print(
                  "there is an error on setNetworkSharedPreferences, error: " +
                      e.toString());
            }
          },
          value: _switchVal,
        );
      },
    );
  }
}
