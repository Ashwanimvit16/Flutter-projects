import 'package:fireapp/board.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());
final FirebaseDatabase database = FirebaseDatabase.instance;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.+
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Community board'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Board> boardmsg = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  DatabaseReference databasereference;

  @override
  void initState() {
    super.initState();
    board = Board("", "");
    databasereference = database.reference().child("Community  board");
    databasereference.onChildAdded.listen(_onentryadded);
    databasereference.onChildChanged.listen(onentrychaged);
      }
    
      //int _counter = 0;
    
      // void _incrementCounter() {
      //   database.reference().child('message').set({'firt': "ash"});
      //   setState(() {
      //     database
      //         .reference()
      //         .child("message")
      //         .once()
      //         .then((DataSnapshot snapshot) {
      //       Map<dynamic, dynamic> data = snapshot.value;
      //       print("The values are: ${data.values}");
      //     });
      //     //_counter++;
      //   });
      // }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              Flexible(
                flex: 0,
                child: Center(
                   child: Form(
                    key: formkey,
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.subject),
                          title: TextFormField(
                            initialValue: "",
                            onSaved: (val) => board.subject = val,
                            validator: (val) => val == "" ? val : null,
                           
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.message),
                          title: TextFormField(
                            initialValue: "",
                            onSaved: (val) => board.body = val,
                            validator: (val) => val == "" ? val : null,
                          ),
                        ),
                        FlatButton(
                          child: Text("Send"),
                          color: Colors.redAccent,
                          onPressed: () {
                            handlesubmit();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FirebaseAnimatedList(
                  query: databasereference,
                  itemBuilder: (_,DataSnapshot snapshot,Animation<double> animation,int index){
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.redAccent,),
                        title: Text(boardmsg[index].subject),
                        subtitle: Text(boardmsg[index].body),
                      ),
                      
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    
      void _onentryadded(Event event) {
        setState(() {
          boardmsg.add(Board.fromSnapshot(event.snapshot));
        });
      }
    
      void handlesubmit() {
        final FormState form = formkey.currentState;
        if (form.validate()) {
          form.save();
          form.reset();
          databasereference.push().set(board.toJson());
        }
      }
    
      void onentrychaged(Event event) {
        
        var oldentry=boardmsg.singleWhere((entry){
          return entry.key==event.snapshot.key;
        });
        setState(() {
          boardmsg[boardmsg.indexOf(oldentry)]=Board.fromSnapshot(event.snapshot);
        });
  }
}
