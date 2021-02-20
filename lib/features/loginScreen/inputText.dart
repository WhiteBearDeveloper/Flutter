import 'package:flutter/material.dart';

Widget inputText(String label, String placeholder, int icon, bool obscured){
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