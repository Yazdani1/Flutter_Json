import 'package:flutter_jsonparsing/Model/Address.dart';
import 'package:flutter_jsonparsing/Model/Company.dart';

class User{

  final int id;
  final String name;

  User({this.id, this.name, this.username, this.email, this.phone, this.website,
    this.address, this.company});

  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  factory User.fromJson(Map<String,dynamic>json){
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company'])
    );
  }

}