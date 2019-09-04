import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class row1 extends StatelessWidget {
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
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("got1",style:TextStyle(fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.w300),textDirection: TextDirection.ltr,),
              new Text(wordPair.asPascalCase,style:TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w400),textDirection: TextDirection.ltr,),
              const Expanded(
                child:const Text("got3"),
              )
               /*  new Container(
                color: Colors.black87,
                alignment: Alignment.bottomLeft,
               child:Text(wordPair.asPascalCase,style:TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),textDirection: TextDirection.ltr,)
          )*/
        ],
      ),
    );
  }
}