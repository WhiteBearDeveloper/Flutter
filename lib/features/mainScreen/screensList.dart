import 'package:flutter/material.dart';
import './screenItem.dart';

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