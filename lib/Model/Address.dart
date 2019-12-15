import 'package:flutter_jsonparsing/Model/Geo.dart';

class Address{

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String,dynamic>json){
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo'])
    );
  }

}