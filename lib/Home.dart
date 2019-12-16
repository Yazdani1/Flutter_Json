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
                          height: 500.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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

                              SizedBox(height: 7.0,),

                              Divider(height: 30.0,indent: 50.0,color: Colors.black,),

                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Text(user.username,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    ),

                                    Text(user.email,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),

                                    Text(user.phone,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.website,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.company.name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.company.catchPhrase,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.company.bs,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.address.city,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    
                                    Text(user.address.street,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),

                                    Text(user.address.suite,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.address.city,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.address.zipcode,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.address.geo.lat,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(user.address.geo.lng,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),


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


