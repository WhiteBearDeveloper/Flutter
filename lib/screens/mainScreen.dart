import 'dart:convert';
import 'package:flutter/material.dart';
import './../data/screensList.dart';

class ScreensList extends StatefulWidget {
  final List<Screen> screens;
  ScreensList({Key key, this.screens});
  @override
  createState() => new ScreensState();
}

class ScreensState extends State<ScreensList> {
  @override

  Widget build(BuildContext context) {
    var screenWidgetList = List<Widget>();
    screenList.forEach((element) {
      screenWidgetList.add(
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.account_circle_outlined,
              size: 40,
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
          ),
          title: Text(element['title'],
              style: TextStyle(
                color: Colors.white,
              )),
          subtitle: Text(
            element['description'],
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pushNamed(context, element['link']);
          },
        ),
      );
      screenWidgetList.add(
          Divider(
            color: Colors.white,
            height: 1.0,
          )
      );
    });
    return ListView(
      padding: EdgeInsets.only(top: 40.0),
      children: screenWidgetList,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> {
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
                // child: ScreensList(),
                child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/screensList.json'),
                  builder: (context, snapshot) {
                    List<Screen> screens =
                    parseJson(snapshot.data.toString());
                    return !screens.isEmpty
                        ? new ScreensList(screens: screens)
                        : new Center(child: new CircularProgressIndicator());
                  }),
              )
            ],
          ),
        ));
  }
  List<Screen> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Screen>((json) => new Screen.fromJson(json)).toList();
  }
}