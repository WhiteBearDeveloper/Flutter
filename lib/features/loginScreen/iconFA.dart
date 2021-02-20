import 'package:flutter/material.dart';

Widget iconFA(String text, int icon){
  return GestureDetector(
    onTap: () => print(text),
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(
                  0,2
              ),
              blurRadius: 6.0
          )
        ],
      ),
      child: Icon(
        IconData(
          icon,
          fontFamily: 'FontAwesomeBrands',
          fontPackage: 'font_awesome_flutter',
        ),
        color: Colors.blue,
      ),
    ),
  );
}