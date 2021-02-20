import 'dart:convert';
import 'package:flutter/material.dart';
import './../features/mainScreen/screenItem.dart';

class ScreensList extends StatelessWidget {
  final List<ScreenItem> screens;
  ScreensList({Key key, this.screens});
  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      itemCount: screens == null ? 0 : screens.length,
      separatorBuilder: (_, __) => const Divider(
          color: Colors.white,
          height: 1.0,
      ),
      itemBuilder: (BuildContext context, int index){
        return ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.account_circle_outlined,
                size: 40,
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(screens[index].title,
                style: TextStyle(
                  color: Colors.white,
                )),
            subtitle: Text(
              screens[index].description,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(context, screens[index].link);
            },
          );
      },
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
                child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString('lib/data/screensList.json'),
                  builder: (context, snapshot) {
                    List<ScreenItem> screens = parseJson(snapshot.data.toString());
                    return screens.isNotEmpty
                        ? new ScreensList(screens: screens)
                        : new Center(child: new CircularProgressIndicator());
                  }),
              )
            ],
          ),
        ));
  }
  List<ScreenItem> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<ScreenItem>((json) => new ScreenItem.fromJson(json)).toList();
  }
}