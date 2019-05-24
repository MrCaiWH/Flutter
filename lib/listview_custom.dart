import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'plan.dart';
import 'cell.dart';
import 'event.dart';

class ListViewCustom extends StatefulWidget {
  ListViewCustom({Key key,this.plan}) : super(key: key);

  final Plan plan;

  _ListViewCustomState createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<ListViewCustom> {

  Widget _listItemBuilder(BuildContext context,int index) {
    Task task = widget.plan.tasks[index];
    return Cell(task: task,selectTaskId: widget.plan.selectTaskId,selectIndex: widget.plan.selectIndex,);
  }

  //监听Bus events
  void _listen(){
    eventBus.on<SelectTaskEvent>().listen((event){
      setState(() {
        widget.plan.selectTaskId = event.taskId;
        widget.plan.selectIndex = event.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

     _listen();

    return Container(
       child: ListView.builder(
          itemCount: widget.plan.tasks.length,
          itemBuilder: _listItemBuilder,
        ),
    );
  }
}