import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Jsjklon"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Center(
              child: Text("Hello We are about to learn flutter json parsing"),
            ),
          ),
        ],
      ),
    );
  }


  
}


