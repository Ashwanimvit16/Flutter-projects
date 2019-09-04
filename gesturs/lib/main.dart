import 'package:flutter/material.dart';
import 'package:gesturs/ui/home.dart';
void main(){
  var title="getures";
  runApp(new MaterialApp(
        title: title,
        home: new Home(title:title,),
  ));
}