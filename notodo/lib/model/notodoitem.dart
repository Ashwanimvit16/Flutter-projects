import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Nodoitem extends StatelessWidget {
  String _itemname, _dateCreated;
  int _id;
  Nodoitem(this._itemname, this._dateCreated);
  Nodoitem.map(dynamic obj) {
    this._dateCreated = obj["dateCreated"];
    this._itemname = obj['itemname'];
    this._id = obj['id'];
  }

  String get dateCreated => _dateCreated;
  String get itemname => _itemname;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["itemname"] = _itemname;
    map["dateCreated"] = _dateCreated;
    if (_id == null) {
      map["id "] = _id;
    }
    return map;
  }

  Nodoitem.fromMap(Map<String, dynamic> map) {
    this._itemname = map["itemname"];
    this._dateCreated = map["dateCreated"];
    this._id = map["id"];
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
            _itemname,
            style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent),
          ),
           new Container(
            margin: EdgeInsets.only(top: 5),
            child: new Text(
              "Created on $_dateCreated",
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
