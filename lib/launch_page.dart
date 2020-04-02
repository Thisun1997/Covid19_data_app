import 'package:flutter/material.dart';

class LaunchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom:40.0),
                child: Image.network("https://www.hpb.health.gov.lk/media/banner/banner-five/5.png",scale: 2.0),
              ),
              Text('Covid-19 Data',textScaleFactor: 3.0, style: TextStyle(color: Colors.white), ),
              Container(
                margin: EdgeInsets.only(top:80.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/screen2');
                  },
                  child: Text('Lauch App', style: TextStyle(fontSize: 20.0, color: Colors.white)), 
                  color: null,
                  hoverColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)
                    ),
                )
              )
            ],
          ) 
        )       
    );
  }
}