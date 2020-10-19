import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'view2.dart';
import 'Listpage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    title: "Flutterlist",
    theme: new ThemeData(
      primarySwatch: Colors.blue,

    ),
      home: ListPage(),
    //),
     );
  }

 
}
