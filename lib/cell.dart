import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'plan.dart';
import 'radio_custom.dart';
import 'event.dart';

class Cell extends StatefulWidget {
  Cell({Key key,this.task,this.selectTaskId,this.selectIndex}) : super(key: key);

  final Task task;
  final int selectTaskId;
  final int selectIndex;

  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {

  void onDataChange(val) {
    setState(() {
      print(val);

      radioList.removeRange(0, radioList.length);

      if(val == 0) {
        radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 0,));
        radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 1));
        radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 2));
      }
      else if (val == 1) {
        radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 0,));
        radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 1));
        radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 2));
      }
      else {
        radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 0,));
        radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 1));
        radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 2));
      }
      //取消其它cell选中状态
      //当前为选中状态

      //如何取消

      //Bus触发事件
      eventBus.fire(SelectTaskEvent(val,widget.task.taskId));
    });
  }

  List<Widget> radioList = [];


  void setUI() {

    radioList.removeRange(0, radioList.length);

    if(widget.task.taskId == widget.selectTaskId) { //同一个cell
        if(widget.selectIndex == 0) {
          radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 0,));
          radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 1));
          radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 2));
        }
        else if (widget.selectIndex == 1) {
          radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 0,));
          radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 1));
          radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 2));
        }
        else {
          radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 0,));
          radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 1));
          radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Selected',callback: (val) => onDataChange(val),tag: 2));
        }
    }
    else {
      
    }

    if(radioList.length == 0) {
      radioList.add(RadioCustom(title: '2小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 0,));
      radioList.add(RadioCustom(title: '4小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 1));
      radioList.add(RadioCustom(title: '8小时',imageName: 'SignIn_Project_Unselected',callback: (val) => onDataChange(val),tag: 2));
    }
  }

  @override
  Widget build(BuildContext context) {

    setUI();

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top:5),
            child: Text('${widget.task.title}',style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none,fontWeight: FontWeight.normal),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Divider(color: Color.fromRGBO(238, 238, 238, 1),)
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: radioList
            ),
          ),
          Container(
            color: Color.fromRGBO(238, 238, 238, 1),
            height: 20,
          )
      ],),
    );
  }
}