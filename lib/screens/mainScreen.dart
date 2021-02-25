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
        body: Stack(
          children: [
            Container(
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
            ),
            new Positioned(
                bottom: 30.0,
                right: 0.0,
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  height: MediaQuery.of(context).size.width * 0.60,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "lib/images/mainScreen/white-bear.png"),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.34), BlendMode.dstATop),
                    ),
                  ),
                  child: new Text('hello'),
                )
            ),
        ]
        ));
  }
}