import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cons.dart';

class Consult extends StatelessWidget {
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            'Emergency Contact'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(
                4.0,
                4.0,
              ),
            )
          ],
        ),

         child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  RaisedButton(

                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      customLaunch('tel:+94 0776665602');
                    },
                    child: Text(
                      'Hospital', style: kTitleTextstyle
                      ),
                    ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      customLaunch('tel:+94 0776665602');
                    },
                    //https://hpb.health.gov.lk/covid19-dashboard/
                    child: Text(
                      'ADHI', style: kTitleTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(60.0),

                    ),
                    onPressed: () {
                      customLaunch('tel:+94 0776665602');
                    },
                    child: Text(
                      'Ambulance',
                      style: kTitleTextstyle,
                    ),
                  ),
                ],
              ),
          )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


