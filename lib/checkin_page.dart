import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'plan.dart';
import 'head.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'listview_custom.dart';

class CheckIn extends StatefulWidget {
  CheckIn({Key key}) : super(key: key);

  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {

  PageController pageController;
  int page = 0;
  int pageCount = plans.length;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void leftTap() {
    if (this.page != 0) {
      pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void rightTap() {
    if (this.page != this.pageCount - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      print(page);
    });
  }

  void submit() {

    Plan plan = plans[page];

    if(plan.selectTaskId == 0) { //未选择任何选项
      Fluttertoast.showToast(
        msg: "请选择一项任务后再提交",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
        msg: "提交成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget head;

    Plan plan = plans[page];

    if(page == 0) {
      head = Head(avatar: plan.avatar,leftCallback: leftTap,rightCallback: rightTap,title: plan.time,leftEnable: false,rightEnable: true,);
    }
    else if (page == pageCount - 1) {
      head = Head(avatar: plan.avatar,leftCallback: leftTap,rightCallback: rightTap,title: plan.time,leftEnable: true,rightEnable: false,);
    }
    else {
      head = Head(avatar: plan.avatar,leftCallback: leftTap,rightCallback: rightTap,title: plan.time,leftEnable: true,rightEnable: true,);
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black,
        middle: Text(
          '项目打卡',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.only(bottom: 5,left: 0),
          child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
          ),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        trailing: GestureDetector(
          child: Text('提交',style: TextStyle(color: Colors.white,fontSize: 15,decoration: TextDecoration.none),),
          onTap: submit
        )
        // FlatButton(
        //     child: Text('提交',style: TextStyle(color: Colors.white),),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        // ),
      ),
      child: Container(
        color: Color.fromRGBO(238, 238, 238, 1),
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(238, 238, 238, 1),
              height: 100,
              child: head,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: onPageChanged,
                itemCount: plans.length,
                itemBuilder: (BuildContext context,int index) {
                    return ListViewCustom(plan: plans[index],);
                },
              )
            )
          ],
        ),
      ),
    );
  }
}