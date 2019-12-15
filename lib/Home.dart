import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_jsonparsing/Model/User.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}



class _HomeState extends State<Home> {

  Future<List<User>>getallUser()async{
    final response = await http.get("https://jsonplaceholder.typicode.com/users");

    List users = json.decode(response.body);
    return users.map((user)=>new User.fromJson(user)).toList();
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Jsjkluyion"),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: FutureBuilder(
            future: getallUser(),
          builder: (context,AsyncSnapshot <List<User>> snapshot){
              if(snapshot.hasError || !snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      
                      var user = snapshot.data[index];
                      
                      return Card(
                        child: Container(
                          height: 200.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Text(user.id.toString(),style: TextStyle(fontSize: 20.0),),
                                      backgroundColor: Colors.green,
                                      maxRadius: 30.0,
                                    ),
                                    SizedBox(width: 10.0,),
                                    Container(
                                      child: Text(user.name.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
          }
        ),
      ),

    );
  }
}


