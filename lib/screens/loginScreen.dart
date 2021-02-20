import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './../features/loginScreen/inputText.dart';
import './../features/loginScreen/iconFA.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  bool _rememberMe = false;

  @override

  Widget build(BuildContext context){
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
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
                        inputText('Email', 'Enter your Email', 57534, false),
                        SizedBox(
                          height: 30.0,
                        ),
                        inputText('Password', 'Enter your Password', 59543, true),
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
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '- OR ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Sign in width',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              iconFA('Login with Facebook', 0xf39e),
                              iconFA('Login with Google', 0xf1a0),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () => print('Sign Up Button Pressed'),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Don\'t have an Account? ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}