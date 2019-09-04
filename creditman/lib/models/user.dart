import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Userinfo extends StatelessWidget {
  String _username, _email;
  int _phone,_credits,_id;
  Userinfo(this._username, this._email,this._phone,this._credits);
  Userinfo.map(dynamic obj) {
    this._id=obj['id'];
    this._email = obj["email"];
    this._username = obj['username'];
    this._phone = obj['phone'];
    this._credits = obj['credits'];
  }

  String get email => _email;
  String get username => _username;
  int get phone => _phone;
  int get id=>_id;
  int get credits => _credits;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["email"] = _email;
    map["credits"] = _credits;
    map["phone "] = _phone;
    if (_phone == null) {
      map["id"] = _id;
    }
    return map;
  }

  Userinfo.fromMap(Map<String, dynamic> map) {
    this._username = map["username"];
    this._email = map["email"];
    this._phone = map["phone"];
    this._credits = map['credits'];
    this._id=map['id'];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(
         child: new Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
             new Text(
            _username,
            style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent),
          ),
           new Container(
            margin: EdgeInsets.only(top: 5),
            child: new Text(
              "id us $_id",
              style:new TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
            ],
            
          ),),
         
        ],
      ),
    );
  }
}
