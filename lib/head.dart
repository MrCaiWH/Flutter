import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Head extends StatelessWidget {

  const Head({Key key,this.leftCallback,this.rightCallback,this.title,this.avatar,this.leftEnable,this.rightEnable}) : super(key: key);

  final VoidCallback leftCallback;
  final VoidCallback rightCallback;
  final String title;
  final bool leftEnable;
  final bool rightEnable;
  final String avatar;

  @override
  Widget build(BuildContext context) {

    Widget leftImage;
    if(leftEnable == true) {
      leftImage = Image.asset('images/SignIn_Project_Left_Normal.png',width: 36,height: 36);
    }
    else {
      leftImage = Image.asset('images/SignIn_Project_Left_Disable.png',width: 36,height: 36);
    }

    Widget rightImage;
    if(rightEnable == true) {
      rightImage = Image.asset('images/SignIn_Project_Right_Normal.png',width: 36,height: 36);
    }
    else {
      rightImage = Image.asset('images/SignIn_Project_Right_Disable.png',width: 36,height: 36);
    }

    return Container(
       child: Container(
         child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    child: leftImage,
                    onTap: leftCallback,
                  )
                ),
                 Container(
                  alignment: Alignment.center,
                  child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(child: Image.asset('images/avatar.png',width: 36,height: 36)),
                        SizedBox(width: 5,),
                        Text(title,style: TextStyle(fontSize: 14,color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    child: rightImage,
                    onTap: rightCallback,
                  ),
                ),
            ],
          )
       ),
    );
  }
}
