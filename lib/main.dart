import 'package:flutter/material.dart';
import './screens/loginScreen.dart';
import './screens/mainScreen.dart';


void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => MainScreen(),
    '/login-screen': (BuildContext context) => WBLoginScreen()
  }));
}
