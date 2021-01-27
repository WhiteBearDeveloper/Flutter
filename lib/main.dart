import 'package:flutter/material.dart';
import './screens/loginScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Экраны')),
      body: new ListView(children: [
        GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, '/login-screen')
          },
          child: Text(
            'Форма авторизации',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
      ])// ListView
      // body: Center(
      //   child: Column(children: [
      //     RaisedButton(
      //       onPressed: (){
      //         Navigator.pushNamed(context, '/login-screen');
      //       },
      //       child: Text(
      //         'Форма авторизации',
      //         style: TextStyle(
      //           color: Colors.white
      //         ),
      //       )
      //     )
      //   ],)
      // ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => MainScreen(),
        '/login-screen':(BuildContext context) => WBLoginScreen()
      }
  ));
}