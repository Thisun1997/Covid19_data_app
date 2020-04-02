import 'dart:io';

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final userAvatarUrl = "https://www.labourstart.org/sars-cov-19.jpg";
  String date;

  MyDrawer(this.date);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text('Covid-19 data',style: TextStyle(fontSize: 20.0),),
                  accountEmail: new Text('data as on '+ date),
                  currentAccountPicture: new CircleAvatar(backgroundImage: NetworkImage(userAvatarUrl,scale: 0.000000000002)),
                  decoration: new BoxDecoration(color: Colors.blueAccent),
              ),
              new ListTile(
                title: new Text('Local'),
                trailing: new Icon(Icons.arrow_forward),
                onTap: () => Navigator.of(context).pushNamed('/screen2')
              ),
              new ListTile(
                title: new Text('Global'),
                trailing: new Icon(Icons.arrow_forward),
                onTap: () => Navigator.of(context).pushNamed('/screen3')
              ),
              new ListTile(title: new Text('Exit'), trailing: new Icon(Icons.close),onTap: () => exit(0)),
            ],
          )
      
    );
  }
}