import 'package:flutter/material.dart';

import 'notodoscrren.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title:Text("Notodo"),
        backgroundColor: Colors.blueAccent,
      ),
      body:new notodoScreen(),
    );
  }
}