import 'dart:async';

import 'package:blocapp/emp.dart';

class empbloc {
  List<User> _userlist = [
    User(1, "one", 10000.0),
    User(2, "two", 10000.0),
    User(3, "three", 10000.0),
    User(4, "four", 10000.0),
  ];

  final _empliststreamcontrol = StreamController<List<User>>();

  final _emplistinccontrol = StreamController<User>();
  final _emplistdecccontrol = StreamController<User>();

  Stream<List<User>> get empliststream => _empliststreamcontrol.stream;

  StreamSink<List<User>> get emplistsink => _empliststreamcontrol.sink;
  StreamSink<User> get empsalinc => _emplistinccontrol.sink;
  StreamSink<User> get empsalidec => _emplistdecccontrol.sink;
  empbloc() {
    _empliststreamcontrol.add(_userlist);
    _emplistinccontrol.stream.listen(_increment);
    _emplistdecccontrol.stream.listen(_decrement);
  }

  void _increment(User event) {
    double sal=event.salary;
    double incsal=sal*0.2;
    _userlist[event.id-1].salary=sal+incsal;
    emplistsink.add(_userlist);
  }

  void _decrement(User event) {
     double sal=event.salary;
    double decsal=sal*0.2;
    _userlist[event.id-1].salary=sal-decsal;
    emplistsink.add(_userlist);
  }

  void dispose(){
    _emplistdecccontrol.close();
    _emplistinccontrol.close();
    _empliststreamcontrol.close();
  }

}
