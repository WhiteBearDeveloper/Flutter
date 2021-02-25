import 'package:flutter/material.dart';
import './screens/loginScreen.dart';
import './screens/mainScreen.dart';
import './screens/petAdoptionScreen.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // '/': (BuildContext context) => MainScreen(),
            '/': (BuildContext context) => petAdoptionScreenMain(),
            '/login-screen': (BuildContext context) => LoginScreen(),
            // '/pet-adoption-screen': (BuildContext context) => petAdoptionScreenMain()
          }
      )
  );
}
