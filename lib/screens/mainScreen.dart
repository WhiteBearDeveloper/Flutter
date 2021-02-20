import 'package:flutter/material.dart';
import './../features/mainScreen/screenItem.dart';
import './../features/mainScreen/screensList.dart';

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
                    List<ScreenItem> screens = parseScreenItemJson(snapshot.data.toString());
                    return screens.isNotEmpty
                        ? new ScreensList(screens: screens)
                        : new Center(child: new CircularProgressIndicator());
                  }),
              )
            ],
          ),
        ));
  }
}