import 'package:flutter/material.dart';
class Home extends StatelessWidget{
  final String title;
  Home({Key key,this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    appBar: new AppBar(
      backgroundColor: Colors.green.shade200,
      title: new Text("gestures"),
    ),
    //body
    body: new Center(
      child: new customButton (),
          ),
          );
        }
        
      }
      
      class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new GestureDetector(
      onTap: (){
        final snackBar=new SnackBar (content:new Text("hello Gestures"),
        backgroundColor: Theme.of(context).backgroundColor,
        duration: new Duration(milliseconds: 10),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        
      },
      child: new Container(
        padding: new EdgeInsets.all(18.5),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(5.5),
        ),
        child: new Text("first button"),
      ),
    ) ;
  }
}