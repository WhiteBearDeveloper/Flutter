import 'package:flutter/material.dart';

class Owner {
  String name;
  String imageUrl;
  String bio;

  Owner({
    this.name,
    this.imageUrl,
    this.bio,
  });
}

class Pet {
  final Owner owner;
  final String name;
  final String imageUrl;
  final String description;
  final int age;
  final String sex;
  final String color;
  final int id;

  Pet({
    this.owner,
    this.name,
    this.imageUrl,
    this.description,
    this.age,
    this.sex,
    this.color,
    this.id,
  });
}

var owner = Owner(
    name: 'Roselia Drew',
    imageUrl: 'assets/images/user.png',
    bio:
    'I recently lost my job and don\'t have enough time or money to tend to Darlene anymore. I have a lot of health issues that need attention and want to give Darlene the best life possible.');
var pets = [
  Pet(
    owner: owner,
    name: 'Pupper Katherine',
    imageUrl: 'assets/images/pug.jpg',
    description: 'French black puppy',
    age: 2,
    sex: 'Female',
    color: 'Black',
    id: 12345,
  ),
  Pet(
    owner: owner,
    name: 'Little Darlene',
    imageUrl: 'assets/images/lab.png',
    description: 'Labrador retriever puppy',
    age: 1,
    sex: 'Female',
    color: 'White',
    id: 98765,
  ),
];

class petAdoptionScreenMain extends StatefulWidget{
  @override
  _petAdoptionScreenMainState createState() => _petAdoptionScreenMainState();
}

class _petAdoptionScreenMainState extends State<petAdoptionScreenMain>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 40.0,
                  width: 40.0,
                  image: AssetImage(owner.imageUrl),
                  fit: BoxFit.cover
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}