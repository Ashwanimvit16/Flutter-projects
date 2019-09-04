import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(
    new MaterialApp(
      title:'welcome home',
      home:new welcome()
      
      
   )
  );
}
class welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Material(
       color:Colors.blueAccent,

     child: new Center(
      child: new Text(
        "avengers endgame",
        textDirection:TextDirection.ltr,
        style: TextStyle(fontStyle: FontStyle.italic,
        fontSize:23,
        fontWeight: FontWeight.w800),
      ),
    )

    );
  }
  
}