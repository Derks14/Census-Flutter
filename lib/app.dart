import 'package:census/screens/home/addPerson.dart';
import 'package:census/screens/home/home.dart';
import 'package:census/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:census/screens/register.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Census',
      onGenerateRoute: _routes(),
//      home: Register(),
    );
  }

  RouteFactory _routes() {
    return(settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;

      switch(settings.name) {
        case '/':
          screen = Login();
          break;
        case '/register':
          screen = Register();
          break;
        case '/home':
          screen = Home();
          break;
        case '/addPerson':
          screen = AddPerson();
          break;
        default:
          screen = Login();
      }
     return MaterialPageRoute( builder: (BuildContext context) => screen);
    };
  }
}