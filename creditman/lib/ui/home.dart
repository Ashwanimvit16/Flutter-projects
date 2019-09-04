import 'package:creditman/models/nextscreen.dart';
import 'package:creditman/models/user.dart';
import 'package:creditman/util/datahelper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget  {
  @override
  _HomeState createState() => _HomeState();
}
//final List<Userinfo> _users = <Userinfo>[];

class _HomeState extends State<Home> {
  var db = new Data_helper();

  Future _gotonextscreen(BuildContext context) async {
    await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new nextscreeen();
                }));
             }
            
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                  appBar: new AppBar(
                    title: new Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.red,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.purple,
                    
                  ),
                  body:new Stack(
                    children: <Widget>[
                      new ListTile(
                          title: new FlatButton(
                          color: Colors.yellowAccent,
                          onPressed: ()=>_gotonextscreen(context),
                          child: new Text("Show all users",style: new TextStyle(
                            fontSize: 30,color: Colors.deepPurpleAccent
                          ),),
                          
                        ),
                          
                      )
                    ],
                  ),
                );
              }
            }
      
      // class nextscreeen extends StatelessWidget  {
        
        

      //   // void adduser() async{
      //   //    await db.saveitems(new Userinfo('Parul', 'par@yahoo',57634737,1500));
      //   // }
      //   @override
      //   Widget build(BuildContext context) {
      //     return new Scaffold(
      //       appBar: new AppBar(
      //         title: new Text("User info"),
      //         centerTitle: true,
      //         backgroundColor: Colors.lightBlueAccent,
      //       ),
      //       body:new Column(
      //         children: <Widget>[
      //           new Flexible( 
      //             child: new ListView.builder(
      //               padding: EdgeInsets.all(8.0),
      //         reverse: false,
      //         itemCount: _users.length,
      //          itemBuilder: (_, int index) {
      //            return new Card(
      //       color: Colors.limeAccent,
      //       elevation: 2.0,
      //       child: new ListTile(
      //         title: new Text("User: ${Userinfo.fromMap(_users[index]).username}"),
      //         subtitle: new Text("Id: ${Userinfo.fromMap(_users[index]).id }"),
      //       ),
      //     );
      //         }

      //             ),

      //           )
      //         ],
      //       ) ,
            
      //     );
      //   }
      // }      
      