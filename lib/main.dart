import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  bool _rememberMe = false;

  Widget _buildInputText(String label, String placeholder, int icon, bool obscured){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Color(0xFF6Ca8F1),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0,2)
                    )
                  ]
              ),
              height: 60.0,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: obscured,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans'
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      top: 14.0
                  ),
                  prefixIcon: Icon(
                      IconData(
                          icon,
                          fontFamily: 'MaterialIcons'
                      ),
                      color: Colors.white
                  ),
                  hintText: placeholder,
                  hintStyle: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'OpenSans'
                  ),
                ),
              )
          )
        ]
    );
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  )
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildInputText('Email', 'Enter your Email', 57534, false),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildInputText('Password', 'Enter your Password', 59543, true),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        padding: EdgeInsets.only(
                          right: 0.0
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        onPressed: () => print('Forgot password Button Pressed'),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.white
                            ),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                            )
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            )
                          ),
                        ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.0
                      ),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        color: Colors.white,
                        onPressed: () => print('Login Button Pressed'),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Color(0xFF527DAA),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}