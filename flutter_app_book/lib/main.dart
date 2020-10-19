
import 'package:flutter/material.dart';
import 'package:flutter_app_book/root/root.dart';
import 'package:flutter_app_book/services/auth.dart';
import 'package:flutter_app_book/utils/ourTheme.dart';
import 'package:provider/provider.dart';
import 'model/authModel.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthModel>.value(
      value: Auth().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
      ),
    );
  }
}
