import 'package:flutter/material.dart';

class makeitrain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new makeitrainstate();
  }
}

class makeitrainstate extends State<makeitrain> {
  int _money = 0;
  void addmoney() {
    setState(() {
      _money += 100;
    });
  }
  _getchange_color(){
    if(_money<5000)
    return Text("₹$_money",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),);
  else
  return Text("₹$_money",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepOrange,
                  ),);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain!"),
        backgroundColor: Colors.blueAccent.shade200,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Make it rich!",
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepPurpleAccent),
              ),
            ),

            new Expanded(
              child:new Center(
               // child: _getchange_color(),
                child: new Text(
                  "₹$_money",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color:_money>2000?Colors.black45:Colors.greenAccent,
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new FlatButton(
                    color: Colors.lightBlueAccent.shade200,
                    onPressed: addmoney,
                    child: new Text(
                      "let it rain",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
