import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _age=new TextEditingController();
  final TextEditingController _weight=new TextEditingController();
  final TextEditingController _height=new TextEditingController();
  double _final=0,hei=0;
  String _result="koi bhi ni";
  void calbmi(){
    setState(() {
      hei=double.parse(_height.text)*12;
      _final=double.parse(_weight.text)/(hei*hei)*703;
      if(_final<18)
      _result="UNDERWEIGHT";
      else if(_final>25)
      _result="OVERWEIGHt";
      else 
      _result="healthy";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: new Text(
          "BMI",
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Image.asset(
              "images/bmilogo.png",
              height: 80,
              width: 70,
              alignment: Alignment.center,
            ),
            new Container(
              color: Colors.grey,
              height: 200,
              width: 400,
              alignment: Alignment.center,
              child: new Column(
                 children: <Widget>[
                   new TextField(
                     controller: _age,
                     keyboardType: TextInputType.numberWithOptions(),
                     decoration: InputDecoration(
                       hintText: "age",
                       icon: new Icon(Icons.person_outline)
                     ),

                   ),
                    new TextField(
                     controller: _height,
                     keyboardType: TextInputType.numberWithOptions(),
                     decoration: InputDecoration(
                       hintText: "height in feet",
                       icon: new Icon(Icons.line_style)
                     ),

                   ),
                    new TextField(
                     controller: _weight,
                     keyboardType: TextInputType.numberWithOptions(),
                     decoration: InputDecoration(
                       hintText: "weight in lbs",
                       icon: new Icon(Icons.line_weight)
                     ),

                   ),
                   new FlatButton(
                     onPressed:calbmi,
                     color: Colors.redAccent,
                    child: new Text("Calculate",style: TextStyle(
                      color: Colors.white30,
                      fontSize: 24,fontWeight: FontWeight.w600
                    ),)
                     
                   )


                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(5)),
            new Column(
              children: <Widget>[
                new Text("Your BMI is ${_final.toStringAsFixed(2)} ",style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.w600,color: Colors.green.shade400,
                ),),
                new Text("person is ${_result.toString()}",style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.w600,color: Colors.indigoAccent.shade200,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
