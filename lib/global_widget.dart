import 'package:first_app/modules/data.dart';
import 'package:first_app/modules/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/MyDrawer.dart';
import 'package:intl/intl.dart';

class GlobalData extends StatefulWidget {
  @override
  _GlobalDataState createState() => _GlobalDataState();
}

class _GlobalDataState extends State<GlobalData> {
  final userAvatarUrl = "https://www.labourstart.org/sars-cov-19.jpg";
  var now = new DateTime.now();
  DataApi dataApi;

  fetchposts() async{
    var response = await http.get(CURRENT_URL,headers: {"content-Type":"application/json"});
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      dataApi = DataApi.fromJson(data);
      return dataApi;
    }
    else{
      return "Sorry for Inconvenience, Server Under Maintainance";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Global Data',style: TextStyle(fontSize: 30.0)),
        ),     
        drawer: MyDrawer((new DateFormat("dd-MM-yyyy").format(now)).toString()),
        body: Center(
          child: FutureBuilder(
            future: fetchposts(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                      child:Center(
                        child: CircularProgressIndicator(),     //if no  data, this is shown
                      )
                    );
                  }
                  else{
                    List<num> data_list = [dataApi.data.global_deaths,dataApi.data.global_new_cases,dataApi.data.global_recovered,dataApi.data.global_total_cases];
                    List<String> titles = ['Total Deaths','New Cases','Total recovered','Total Cases'];
                    List<Color> colors = [Colors.red,Colors.brown,Colors.green,Colors.blue];
                    
                    var children = <Widget>[];
                    for (var i = 0; i < data_list.length; i++) {
                      children.add(
                          new Card(
                            color: colors[i],
                            elevation: 8.0,
                            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                              leading: Icon(Icons.album),
                              title: Text(titles[i].toString(),style: TextStyle(fontSize: 25.0,color: Colors.white)),
                              subtitle: Text(data_list[i].toString(),style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.w600)),
                            ),
                        ));
                    }
                    
                    children.add(Text('Last updated '+dataApi.data.update_date_time));
                    return Column(
                      children: children
                    );
            
                    
                  }
                }
          ),
        )
    );
  }
}