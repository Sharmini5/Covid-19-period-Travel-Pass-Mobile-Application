import 'package:flutter/material.dart';
import 'package:flutter_app_book/permission/Listpage.dart';
import 'package:flutter_app_book/permission/permission.dart';
import 'package:flutter_app_book/splashScreen/consult.dart';
import 'package:flutter_app_book/splashScreen/info_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<HomePage> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home page passengers"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UploadPage()));
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Request permission"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListPage()));
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Permission details"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Consult()));
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Call"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoScreen()));

                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Precautions"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    const url = 'https://hpb.health.gov.lk/covid19-dashboard/';
                    customLaunch(url);
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("News update"),
                  textColor: Colors.white,
                ),
              ],
            ),
          ]),
        ));
  }
}
