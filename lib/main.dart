import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'checkin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            '首页',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.black,
        ),
        child: Container(
          alignment: Alignment.center,
          child: RaisedButton(
            child: new Text('点我'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckIn()));
            },
          ),
        ),
    );
  }

}
