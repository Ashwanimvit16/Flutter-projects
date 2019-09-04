import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    title: "first screen",
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _inputctrl=new TextEditingController();
  Future _gotonextscreen(BuildContext context) async{
    Map results= await Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context){
          return new nextscreen(name: _inputctrl.text,);
      })
    );
    if(results!=Null&& results.containsKey('info')){
      print(results['info']);
      _inputctrl.text=results['info'].toString();

    }
    else{
      print("nothing");
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("climate"),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,

      ),
      body: new ListView(
        children: <Widget>[
          new TextField(
            controller: _inputctrl,
            decoration: InputDecoration(
              hintText: "enter city name",
              labelText: "enter name",
            ),
          ),
          new ListTile(
            title:new RaisedButton(
              child: new Text("send to next xcreen"),
              onPressed: (){
                _gotonextscreen(context);
              }
            ),
          ),
        ],
      ),
      
    );
  }
}
class nextscreen extends StatefulWidget {
  final String name;

  nextscreen({Key key, this.name}) : super(key: key);
  
  @override
  _nextscreenState createState() => _nextscreenState();
}

class _nextscreenState extends State<nextscreen> {
  var _backetxt=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text("second screen") ,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),
            new ListTile(
              title: new TextField(
                controller: _backetxt,

              ),
            ),
            new ListTile(
              title: new FlatButton(
                onPressed: (){
                  Navigator.pop(context,{
                    'info':_backetxt.text 
                  });
                },
                child: new Text("Send data back"),
              ),
            ),
          ],
        ),
      ),
      // body: new ListTile(
      //   title: new Text('${widget.name}'),
      // ),
      
    );
  }
}