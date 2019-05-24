import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RadioCustom extends StatelessWidget {

  const RadioCustom({Key key, this.title, this.imageName,this.tag,this.callback}) : super(key: key);

  final String title;
  final String imageName;
  final int tag;

  final callback;

  void onSelect() {
    callback(tag);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
       child: Row(
         children: <Widget>[
          GestureDetector(
           child: Row(
             children: <Widget>[
              Container(
                child: Image.asset('images/'+imageName+'.png',width: 26,height: 26),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(title,style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
              ),
            ],),
            onTap: onSelect
          )
         ],
       ),
    );
  }
}