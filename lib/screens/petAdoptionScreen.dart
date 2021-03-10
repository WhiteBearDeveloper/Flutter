import 'package:flutter/cupertino.dart';
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
    imageUrl: 'lib/images/petAdoptionScreen/user.jpg',
    bio:
    'I recently lost my job and don\'t have enough time or money to tend to Darlene anymore. I have a lot of health issues that need attention and want to give Darlene the best life possible.');
var pets = [
  Pet(
    owner: owner,
    name: 'Pupper Katherine',
    imageUrl: 'lib/images/petAdoptionScreen/black-puppy.jpg',
    description: 'Black puppy',
    age: 2,
    sex: 'Female',
    color: 'Black',
    id: 12345,
  ),
  Pet(
    owner: owner,
    name: 'Little Darlene',
    imageUrl: 'lib/images/petAdoptionScreen/dog.jpg',
    description: 'Labrador retriever',
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
  Widget petCategory(bool isSelected, String category){
    return GestureDetector(
      onTap: () => print('Select category'),
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 80.0,
        decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : Color(0xFFF8F2F7),
            borderRadius: BorderRadius.circular(20.0),
            border: isSelected ? Border.all(
              width: 8.0,
              color: Color(0xFFFED8D3)
            ) : null,
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 40.0,
              top: 40.0
            ),
            alignment: Alignment.centerLeft,
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
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 40.0
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22.0
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                      right: 30.0
                  ),
                  child: Icon(
                    Icons.add_location,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
                labelText: 'Location',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
                ),
                contentPadding: EdgeInsets.only(
                  bottom: 20.0
                )
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 15.0
              )
          ),
          Container(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20.0
                  ),
                  child: IconButton(
                    onPressed: () => print('Filters'),
                    icon: Icon(
                      Icons.search,
                      size: 35.0
                    ),
                  ),
                ),
                petCategory(false, 'Cats'),
                petCategory(true, 'Dogs'),
                petCategory(false, 'Birds'),
                petCategory(false, 'Other'),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 40.0,
                bottom: 30.0
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: pets[0].id,
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)
                      ),
                      image: DecorationImage(
                        image: AssetImage(pets[0].imageUrl),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 40.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          pets[0].name,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite_border),
                            iconSize: 30.0,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => print('Favorite ${pets[0].name}')
                        )
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
                    child: Text(
                      pets[0].description,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        color: Colors.grey
                      ),
                    ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 40.0,
                bottom: 30.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: pets[1].id,
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)
                        ),
                        image: DecorationImage(
                            image: AssetImage(pets[1].imageUrl),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 12.0, 40.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          pets[1].name,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite_border),
                            iconSize: 30.0,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => print('Favorite ${pets[1].name}')
                        )
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
                  child: Text(
                    pets[1].description,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        color: Colors.grey
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}