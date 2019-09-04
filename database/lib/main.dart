import 'package:database/models/user.dart';
import 'package:database/util/databse_helper.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

  List _users;
  void main(List<String> args)  async{
  var db=new Data_helper();
 // await db.saveuser(new User("shina","dhingra"));
  //print("savrd user=$insuser");
  
  //count user
  int count= await db.countuser();
  print("user count is:$count");
  //retireve a user
   
    User ana= await db.getuser(3);
    print("user is ${ana.password}");
  
  
  //delete user
    //int userdeleted= await db.deleteuser(2);

    //update user
    User GINA= await db.getuser(6);
    User Ginaupdated= User.fromMap({
      "username":"Gina",
      "password":"kalka",
      "id":6}
    );
    await db.updateuser(Ginaupdated);

  //show all users
  _users=await db.getalluser();
  
  for (var i = 0; i < _users.length; i++) {
    User user= User.map(_users[i]);
    print("Username :${user.username}"+" user id: ${user.id}");
  }

  //original ui
  runApp(new MaterialApp(
    title:'databse intro',
    home:new Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title: new Text("database intro"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_,int pos){
          return new Card(
            color: Colors.limeAccent,
            elevation: 2.0,
            child: new ListTile(
              title: new Text("User: ${User.fromMap(_users[pos]).username}"),
              subtitle: new Text("Id: ${User.fromMap(_users[pos]).id }"),
            ),
          );

        },
      ),
      
    );
  }
}