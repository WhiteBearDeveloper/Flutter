import 'package:flutter/material.dart';
import './screens/loginScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
                subtitle: Text(
                  'Screen with login form',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login-screen');
                },
              ),
              Divider(
                color: Colors.white,
                height: 1.0,
              ),
            ],
            ),
        )
    );
  }
}

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => MainScreen(),
    '/login-screen': (BuildContext context) => WBLoginScreen()
  }));
}
