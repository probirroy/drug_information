import 'package:flutter/material.dart';

import 'src/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drug Dctionary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
        disabledColor: Colors.grey,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(
            fontSize: 22.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          subtitle2: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
          ),
          bodyText2: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.black87
          ),
          headline4: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black87
          ),
        ),
        buttonTheme: ButtonThemeData(
          minWidth: 0,
        ),
      ),
      home: DashBoard(),
    );
  }
}
