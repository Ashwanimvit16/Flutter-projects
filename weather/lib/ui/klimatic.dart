import 'package:flutter/material.dart';
import 'package:weather/util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Map data;

class klimatic extends StatefulWidget {
  @override
  _klimaticState createState() => _klimaticState();
}

class _klimaticState extends State<klimatic> {
  String _cityenterd;
  void _show() async {
    data = await getweather(util.appId, util.cityname);
    print(data.toString());
  }

  Future _gotonextscreen(BuildContext context) async {
    Map results = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new changecity();
    }));
    if (results != Null && results.containsKey('enter')) {
      _cityenterd = results['enter'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Klimatic weather app",
          style: TextStyle(
            fontSize: 21,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _gotonextscreen(context);
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/umbrella.png',
              height: 600,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: new Text(
              '${_cityenterd == null ? util.cityname : _cityenterd}',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: Image.asset('images/light_rain.png'),
          ),
          //this contains weather data
          new Container(
            margin: const EdgeInsets.fromLTRB(30, 310, 0, 0),
            child: updatetemp(_cityenterd),
          ),
        ],
      ),
    );
  }

  Future<Map> getweather(String appId, String city) async {
    String apiurl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&units=imperial&appid=${util.appId}";
    http.Response response = await http.get(apiurl);
    return jsonDecode(response.body);
  }

  Widget updatetemp(String city) {
    return new FutureBuilder(
        future: getweather(util.appId, city == null ? util.cityname : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snap) {
          if (snap.hasData) {
            Map content = snap.data;
            return new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text("\t\t"+
                      content['main']['temp'].toString()+"  F",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                          "Humidity:${content['main']['humidity'].toString()}\n"
                          "Min-Temp:${content['main']['temp_min'].toString()} F\n"
                          "Max_temp:${content['main']['temp_max'].toString()} F",
                          style: TextStyle(fontSize: 23,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}

class changecity extends StatelessWidget {
  var _citynamectrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('data'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/white_snow.png',
              width: 490,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  controller: _citynamectrl,
                  decoration: InputDecoration(labelText: 'Enter the city name'),
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'enter': _citynamectrl.text,
                    });
                  },
                  child: new Text("get Weather"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
