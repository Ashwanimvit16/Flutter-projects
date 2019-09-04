import 'package:flutter/material.dart';
import 'package:notodo/model/notodoitem.dart';
import 'package:notodo/util/datahelp.dart';
import 'package:notodo/util/datefor.dart';
import 'package:sqflite/sqflite.dart';

class notodoScreen extends StatefulWidget {
  @override
  _notodoScreenState createState() => _notodoScreenState();
}

class _notodoScreenState extends State<notodoScreen> {
  final TextEditingController _textEditControl = new TextEditingController();
  var db = new Data_helper();

  final List<Nodoitem> _itemlist = <Nodoitem>[];

  void _handleSubmit(String text) async {
    _textEditControl.clear();
    Nodoitem nodoitem = new Nodoitem(text, dateformatted());
    int saveitemid = await db.saveitems(nodoitem);
    Nodoitem addeditem = await db.getitem(saveitemid);

    setState(() {
      _itemlist.insert(0, addeditem);
    });
  }

  @override
  void initState() {
    super.initState();
    _readnodolist();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black38,
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: false,
              itemCount: _itemlist.length,
              itemBuilder: (_, int index) {
                return new Card(
                  color: Colors.white,
                  child: new ListTile(
                    title: _itemlist[index],
                    onLongPress: () => updatenodo(_itemlist[index], index),
                    trailing: new Listener(
                      key: new Key(_itemlist[index].itemname),
                      child: new Icon(
                        Icons.remove_circle,
                        color: Colors.redAccent,
                      ),
                      onPointerDown: (PointerEvent) =>
                          deletenodo(_itemlist[index].id, index),
                    ),
                  ),
                );
              },
            ),
          ),
          new Divider(
            height: 1.0,
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Add item",
          backgroundColor: Colors.blue,
          child: new ListTile(
            title: new Icon(Icons.add),
          ),
          onPressed: _showform),
    );
  }

  void _showform() {
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: _textEditControl,
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: "item",
                  hintText: "kch bhi enter kr na ",
                  icon: new Icon(Icons.note_add)),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _handleSubmit(_textEditControl.text);
            _textEditControl.clear();
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        new FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("cancel"),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _readnodolist() async {
    List items = await db.getitems();
    items.forEach((item) {
      // Nodoitem nodoitem = Nodoitem.map(items);
      setState(() {
        _itemlist.add(Nodoitem.map(item));
      });
    });
  }

  deletenodo(int id, int index) async {
    debugPrint("item deleted");
    await db.deleteitem(id);
    setState(() {
      _itemlist.removeAt(index);
    });
  }

  updatenodo(Nodoitem item, int index) {
    debugPrint("Item updated");
    var alert = new AlertDialog(
      title: new Text("update"),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: _textEditControl,
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: "iterm",
                  hintText: "dont buy stuff",
                  icon: new Icon(Icons.update)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () async {
            Nodoitem newitemupdated =
                Nodoitem.fromMap({"itemname": _textEditControl.text,
                "dateCreated":dateformatted(),
                "id":item.id
                });
                _handleSubmitupdate(index,item);
                await db.updateitem(newitemupdated);
                setState(() {
                  _readnodolist();
                });
                Navigator.pop(context);
                          },
                          child: new Text("update"),
                        ),
                        new FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: new Text("cancel"),
                        ),
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (_) {
                          return alert;
                        });
                  }
                
                  void _handleSubmitupdate(int index, Nodoitem item) {
                    _textEditControl.clear();
                    setState(() {
                      _itemlist.removeWhere((element){
                        _itemlist[index].itemname==item.itemname;
                      });
                    });

                  }
}
