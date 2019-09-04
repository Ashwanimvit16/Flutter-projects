import 'package:creditman/ui/home.dart';
import 'package:creditman/util/datahelper.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';
List _users;
void main() {
  
       
    runApp(new MaterialApp(
    title:'databse intro',
    home:new Home(),
    debugShowCheckedModeBanner: false,
  ));
}
