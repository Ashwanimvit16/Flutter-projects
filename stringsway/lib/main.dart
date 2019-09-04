import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final List<String> list = [
      'https://m.media-amazon.com/images/M/MV5BNDBhNDJiMWEtOTg4Yi00NTYzLWEzOGMtMjNmNjAxNTBlMzY3XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UY209_CR2,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMTU5OTczMTcxMV5BMl5BanBnXkFtZTcwNDg3MTEzMw@@._V1_UY209_CR1,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_UY209_CR0,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BNzg1MDQxMTQ2OF5BMl5BanBnXkFtZTcwMTk3MjAzOQ@@._V1_UY209_CR0,0,140,209_AL_.jpg',
      'https://m.media-amazon.com/images/M/MV5BMTg0NTIzMjQ1NV5BMl5BanBnXkFtZTcwNDc3MzM5OQ@@._V1_UY209_CR0,0,140,209_AL_.jpg'
    ];
    String desc =
        'Hugh Michael Jackman (born 12 October 1968)[1] is an Australian actor, singer, and producer. '
        'Jackman has won international recognition for his roles in a variety of film genres. '
        'He is known for his long-running role as Wolverine in the X-Men film series, as well as for his lead roles in films such as the romantic-comedy fantasy Kate & Leopold (2001), '
        'the action-horror film Van Helsing (2004), the magic-themed drama The Prestige (2006), '
        'the epic fantasy drama The Fountain (2006), the epic historical romantic drama Australia (2008), '
        'the film version of Les Misérables (2012), the thriller Prisoners (2013), and the musical The Greatest Showman (2017). '
        'His work in Les Misérables earned him his first Academy Award nomination for Best Actor and his first Golden Globe Award for Best Actor – Motion Picture Musical or Comedy in 2013.';

    return new Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        begin: Alignment.topRight,
        end: new Alignment(
            0.0, 1.0), // 10% of the width, so there are ten blinds.
        colors: [
          const Color(0xFFDC143C),
          const Color(0xFFDC143C),
        ], // whitish to gray
        tileMode: TileMode.clamp, // repeats the gradient over the canvas
      )),
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: Alignment.topRight,
            child: new Padding(
              padding: new EdgeInsets.only(top: _height / 7, left: _width / 20),
              child: new Material(
                child: new CircleAvatar(
                    backgroundImage: new AssetImage(
                      'images/minion.jpeg',
                    ),
                    radius: _height / 12),
                  
                elevation: 15.0,
                color: Colors.transparent,
                borderRadius:
                    new BorderRadius.all(new Radius.circular(_height / 6)),
              ),
              
            ),
          ),
          // new Padding(
          //   padding: new EdgeInsets.only(top: _height / 3.3, left: _width / 20),
          //   child: new Material(
          //     child: new CircleAvatar(
          //         backgroundImage: new AssetImage(
          //           'images/minion.jpeg',
          //         ),
          //         radius: _height / 12),
          //     elevation: 15.0,
          //     color: Colors.transparent,
          //     borderRadius:
          //         new BorderRadius.all(new Radius.circular(_height / 12)),
          //   ),
          // ),
//           )
          new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              actions: <Widget>[
                new IconButton(icon: new Icon(Icons.menu), onPressed: () {})
              ],
            ),
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(left: _width / 20),
                    child: new Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // new SizedBox(
                        //   height: _height / 30,
                        // ),
                        Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Expanded(
                                child: new Text(
                                  'less                             but                                 flutter',
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 50, color: Colors.black),
                                  maxLines: 3,
                                ),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.only(
                                  left: _width / 30, top: _height / 5.5,right: _width/8),
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'BRION',
                                  style: new TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: _height / 100,
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 3.5,
                        // left: _width / 20,
                        // right: _width / 20,
                        bottom: _height / 9),
                    child: Container(
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'BOB',
                                    style: new TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new SHLabel(
                                        label: 'ACTOR',
                                      ),
                                      new SHLabel(
                                        label: 'PRODUCER',
                                      ),
                                    ],
                                  ),
                                  new SizedBox(
                                    height: _height / 50,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: new Icon(
                                      Icons.arrow_back_ios,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                      icon: new Icon(Icons.arrow_forward_ios),
                                      onPressed: () {})
                                ],
                              ),
                            ],
                          ),
                          new SingleChildScrollView(
                            child: new Text(
                              desc,
                              style: new TextStyle(
                                  fontSize: 10.0, fontStyle: FontStyle.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(
//                          height: _height / 4,
                          margin: EdgeInsets.only(
                              left: _width / 20, right: _width / 20),
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black.withAlpha(70),
                                    offset: const Offset(0.0, -10.0),
                                    blurRadius: 10.0),
                              ],
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          padding: new EdgeInsets.all(_width / 40),
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'MOVIES',
                                    style: new TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Expanded(
                                    child: new Text(
                                      '...',
                                      style: new TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                              new Container(
                                height: _height / 5,
                                child: new ListView.builder(
                                  itemBuilder: (context, index) {
                                    return new Container(
                                        width: _width / 4,
                                        height: _height / 6,
                                        margin: new EdgeInsets.all(_width / 40),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // borderRadius: new BorderRadius.all(
                                            //     new Radius.circular(5.0)),
                                            image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  '${list[index % list.length]}'),
                                            )),
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: _height / 5),
                                        child: new Text("despicna",
                                            style: TextStyle(fontSize: 8),
                                            textScaleFactor: 1.5));
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                        ),
                        new SizedBox(
                          height: _height / 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SHLabel extends StatelessWidget {
  String label;
  SHLabel({this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      child: Text(
        label,
        style: new TextStyle(fontSize: 10.0, color: Colors.white),
      ),
      decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.all(new Radius.circular(8.0))),
      margin: EdgeInsets.only(right: 4.0),
    );
  }
}
