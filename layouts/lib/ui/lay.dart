import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Lay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return new Container(
      /* color: Colors.indigo,
          alignment: Alignment.centerLeft,
          child: new Text("hello hunny bunny",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontStyle: FontStyle.italic,fontSize: 26,fontWeight: FontWeight.w600),),
          */
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "avenger",
            style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300),
            textDirection: TextDirection.ltr,
          ),
          new Text(
            "avenger:age of ultron",
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400),
            textDirection: TextDirection.ltr,
          ),
          new Text(
            "avenger:infinty war",
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
            textDirection: TextDirection.ltr,
          ),
          new Text(
            "avenger",
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
            textDirection: TextDirection.ltr,
          ),
          new Container(
              color: Colors.black87,
              alignment: Alignment.bottomLeft,
              child: Text(
                wordPair.asPascalCase,
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
                textDirection: TextDirection.ltr,
              ))
        ],
      ),
    );
  }
}
