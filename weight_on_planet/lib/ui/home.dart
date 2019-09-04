import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radiovalue = 0;
  double _weight=0.0;
  String _formattedweight="";
  void handlechange(int value) {
    setState(() {
      radiovalue = value;
      switch(radiovalue){
        case 0:
        _weight=calweight(_weightcontroller.text,.06);
        _formattedweight="Your weight in pluto is ${_weight.toStringAsFixed(2)}";
        break;
        case 1:
        _weight=calweight(_weightcontroller.text,.38);
        _formattedweight="Your weight in mars is ${_weight.toStringAsFixed(2)}";
        break;
        case 2:
        _weight=calweight(_weightcontroller.text,.91);
        _formattedweight="Your weight in venus is ${_weight.toStringAsFixed(2)}";
              }
            });
          }
          final TextEditingController _weightcontroller=new TextEditingController();
        
          @override
          Widget build(BuildContext context) {
            return new Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.greenAccent,
                centerTitle: true,
                title: new Text(
                  "Weight on Planet X",
                  style: TextStyle(
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
              backgroundColor: Colors.blueGrey,
              body: new Container(
                alignment: Alignment.topCenter,
                child: new ListView(
                  padding: const EdgeInsets.all(2.5),
                  children: <Widget>[
                    Image.asset(
                      "images/planet.png",
                      height: 133,
                      width: 120,
                      alignment: Alignment.topCenter,
                    ),
                    new Container(
                      margin: EdgeInsets.all(3.5),
                      alignment: Alignment.center,
                      child: new Column(
                        children: <Widget>[
                          new TextField(
                            controller: _weightcontroller,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              labelText: "Enter the weight in earth",
                              hintText: "in pounds",
                              icon: Icon(Icons.person_outline),
                            ),
                          ),
                          new Padding(
                            padding: EdgeInsets.all(2.5),
                          ),
                          new Row(
                            children: <Widget>[
                              new Radio<int>(
                                activeColor: Colors.orangeAccent,
                                value: 0,
                                groupValue: radiovalue,
                                onChanged: handlechange,
                              ),
                              new Text(
                                "pluto",
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              new Radio<int>(
                                activeColor: Colors.red,
                                value: 1,
                                groupValue: radiovalue,
                                onChanged: handlechange,
                              ),
                              new Text(
                                "mars",
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              new Radio<int>(
                                value: 2,
                                activeColor: Colors.yellow,
                                groupValue: radiovalue,
                                onChanged: handlechange,
                              ),
                              new Text(
                                "venus",
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                            ],
                          ),
                          new Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          new Text(
                           _weightcontroller.text.isEmpty?"please enter your weight":_formattedweight+"lbs",
                            //"$_formattedweight lbs",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white54,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        
          double calweight(String text, double d) {
            if(int.parse(text).toString().isNotEmpty && int.parse(text)>0)
            return int.parse(text)*d;
            else{
              print("wrong value");
              return int.parse("180")*.34;
            }

          }
}
