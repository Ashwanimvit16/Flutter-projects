import 'package:flutter/material.dart';

class Sca extends StatelessWidget {
  void _onpressed() {
    print("circle is added");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade200,
        title: Text("iron man"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => debugPrint("icon tappeed"),
          ),
          new IconButton(
            icon: new Icon(Icons.add_circle),
            onPressed: _onpressed,
          )
        ],
      ),
      //other properties
      backgroundColor: Colors.lightBlueAccent.shade200,
      body: new Container(
          alignment: Alignment.topCenter,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Bring me Thanos",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54),
              ),
              new InkWell(
                child: new Text("BUTON"),
                onTap: ()=>debugPrint("button tapped"),
              ),
            ],
          )),
          //floating widgets
          floatingActionButton: new FloatingActionButton(
            onPressed: ()=>debugPrint("pressed"),
            tooltip: "Up and Up",
            backgroundColor: Colors.grey.shade600,
            child: new Icon(Icons.computer),

          ),
          //bottom navigation
          bottomNavigationBar: new BottomNavigationBar(items: [
            new BottomNavigationBarItem(icon:new Icon(Icons.add_a_photo),title: Text("Photos")),
            new BottomNavigationBarItem(icon:new Icon(Icons.accessible),title: Text("handicapped")),
            new BottomNavigationBarItem(icon:new Icon(Icons.content_paste),title: Text("contacts")),
          ],
          onTap: (int i)=>debugPrint("pressed $i"),
          ),
    );
  }
}
