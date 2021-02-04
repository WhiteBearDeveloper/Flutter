import 'package:flutter/material.dart';
import './screens/loginScreen.dart';

class ScreenListParams{
  String name;
  String description;
  String link;
}

class ScreensList extends StatefulWidget {
  @override
  createState() => new ScreensState();
}

class ScreensState extends State<ScreensList> {
  List<ScreenListParams> _array = [
    {
      name: 'Login',
      description: 'Screen with login form',
      link: '/login-screen'
    }
  ];

  @override
  Widget build(BuildContext context) {

  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Text("All Screens",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 40.0),
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
                      title: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                          )),
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
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => MainScreen(),
    '/login-screen': (BuildContext context) => WBLoginScreen()
  }));
}
