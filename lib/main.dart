import 'package:flutter/material.dart';

void main() {
  // The main aim of the project is to understand how to create a model in Flutter
  //Creating a map/json response  in Flutter.
  // there are various ways of creating a map
  // FIRST WAY OF CREATING A MAP
  var mapObj1 = {"name": "Habeeb", "age": 30, "country": "Bangul"};

  // SECOND WAY OF CREATING A MAP
  var mapObj2 = new Map();
  mapObj2["name"] = "Ahmed";
  mapObj2["age"] = "40";
  mapObj2["country"] = "Nigeria";

  print(mapObj2);
  // {name: Ahmed, age: 40, country: Nigeria}

  // THIRD WAY OF CREATING A MAP
  var mapObj3 = Map<String, dynamic>();
  mapObj3["name"] = "Baba Ginda";
  mapObj3["age"] = "68";
  mapObj3["country"] = "Kebbi";

  print(mapObj3);
  // {name: Baba Ginda, age: 68, country: Kebbi}

  // What are Models?
  // Models are just like classes which helps determine and represent the structure and attributes of a specific type of data in an application.

  // Assuming we receive this map/JSON data from the backEnd
  var response = {
    "name": "Habeeb",
    "age": 30,
    "city": "Lagos",
    "address": [
      {"country": "Nigeria", "city": "Lere"},
      {"country": "Ghana", "city": "lekwe"}
    ]
  };
  var addressList = response['address'];

  (addressList as List).forEach((e) {
    print(e['city']);
  });


  // after crreating the model, now we can use the model 
  var obj = Person.fromJson(response); 
  print('${obj.age} gotten from the backEnd managed by the Person"s model created');
  print(obj.address);
  var myAddress = obj.address;

  myAddress!.map((e){
    print(e.country);
  }).toList();
}

//  Building a model for your project
//  There are variety of benefit using model
// - one will be able to access a data easily
// - Changes can easily be applied without stress
// We would be building a model called Person

class Person {
  String? name;
  int? age;
  String? city;
  // here we are suppose to make a property for "address"
  // NB:  "address" is a List of Map
  // and for each Map we have to make a Model
  // so, here we are gonna be having a List of Model which is the "address"
  List<Area>? address;

  // constructor
  Person({this.name, this.age, this.city, this.address});
  // writing FromJson method that takes a JSON parameter
  // the essence of this "FromJson" is to store the JSON values coming
  //from the backEnd to be initialized with our model.
  // in other Words our Model will be able to have access to the value of each key from the backEnd
  // And also if any changes is made from the backEnd to the JSON it will automatically be updated in our model which is in turn update on the UI where the model has been used.

  Person.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    age = json["age"];
    city = json['city'];
    //  we check if the address List from the backEnd is not empty.
    // if it is empty, we do nothing. but, if it is not empty we
    //
    if (json['address'] != null) {
      address = <Area>[];
      (json['address'] as List).forEach((e) {
        address!.add(Area.fromJson(e));
      });
    }
  }
}

class Area {
  String? country;
  String? city;

  Area({this.city, this.country});
  Area.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['ci†y'];
  }
}
