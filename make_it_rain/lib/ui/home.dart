import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Make it rain"),
          backgroundColor: Colors.blue.shade300,
        ),
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "make it rich",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: ()=>"tap",
          tooltip: 'maki it rain',
          backgroundColor: Colors.cyan.shade400,
        child: new Icon(Icons.add_to_queue),
        ),
        );
  }
}
