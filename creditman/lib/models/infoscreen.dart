import 'package:creditman/models/user.dart';
import 'package:creditman/util/datahelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Infoscreen extends StatefulWidget {
  final int id;

  const Infoscreen({Key key, @required this.id}) : super(key: key);

  @override
  _InfoscreenState createState() => _InfoscreenState();
}

class _InfoscreenState extends State<Infoscreen> {
  var db = new Data_helper();
  
  Userinfo _user=Userinfo("","",87,4);

  _read() async {
    _user = await db.getitem(widget.id);
    
  }
  
  @override
  void initState() {
    super.initState();
    _read();
    
  } 
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.id}"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Card(
          color: Colors.amber,
          elevation: 5.2,
          child:       
            new ListView(
              children: <Widget>[
                  Container(
                    child: Text(
                    "UserName: ${_user.username}",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                  ),
                Container(
                  child: Text(
                      "Email:  ${_user.email}",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                ),
                
                
                 Container(
                   child: Text(
                      "Phone:  ${_user.phone}",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                 ),
                
                Container(
                  child: Text(
                    "Credits:  ${_user.credits}",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
        
        ),
      ),
    );
  }
}

//     void _readnodolist(int id) async {
//       Userinfo item = await db.getitem(id);

// }
