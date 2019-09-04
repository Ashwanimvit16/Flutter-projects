import 'package:creditman/models/infoscreen.dart';
import 'package:creditman/models/user.dart';
import 'package:creditman/util/datahelper.dart';
import 'package:flutter/material.dart';

class nextscreeen extends StatefulWidget {
  @override
  _nextscreeenState createState() => _nextscreeenState();
}

var db = Data_helper();

//Future<List> _users = db.getitems("tabEmployee"); // CALLS FUTURE

class _nextscreeenState extends State<nextscreeen> {
  // _savedata() async{
  //    await db.saveitems(new Userinfo('Parul', 'uasisai@yahoo',5232322,1500));
  //       await db.saveitems(new Userinfo('piyush', 'psdy@yahoo',84566558,1500));
  //       await db.saveitems(new Userinfo('ASh', 'uysytdsay@yahoo',5856365656,1500));
  //       await db.saveitems(new Userinfo('ul', 'ksddsr@yahoo',585558,1500));
  //       await db.saveitems(new Userinfo('Kartic', 'kartic@yahoo',8656565,1500));
  //       await db.saveitems(new Userinfo('hersh', 'sanon@yahoo',8955445,1500));
  //       await db.saveitems(new Userinfo('QWERTY', 'kriti@yahoo',78634737,1500));
  //       await db.saveitems(new Userinfo('Steve', 'stve@yahoo',634737,1500));
  //       await db.saveitems(new Userinfo('Rohan', 'rohn@yahoo',7895545,1500));

  // }
  //  @override
  // void initState() {
  //   super.initState();
  //   _savedata();
  // }

  // Future _gotonextscreen(BuildContext context,int pos) async {
  //   await Navigator.of(context)
  //       .push(new MaterialPageRoute(builder: (BuildContext context) {
  //     return new Infoscreen(pos);
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Employees'),
      ),
      body: FutureBuilder<List>(
        future: db.getitems(),
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, int position) {
                    if (position.isOdd) return new Divider();
                    final index = position ~/ 2;
                    final item = snapshot.data[index];
                    //get your item data here ...
                    return Card(
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   child: new Text(
                        //     "${snapshot.data[position].row[1]}."
                        //         .toString()
                        //         .toUpperCase(),
                        //     style: TextStyle(
                        //       fontSize: 19,
                        //     ),
                        //   ),
                        // ),
                        title: Text("Employee Name: " +
                            snapshot.data[index].row[1].toString()),
                        onTap: () => {
                           Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new Infoscreen(id:snapshot.data[position].row[0]),),),
                          
                          },
                        
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
