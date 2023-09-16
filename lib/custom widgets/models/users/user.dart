import 'package:flutter/material.dart';

class UserModel {
  String firstName;
  String lastName;
  List<Widget>? visited; //TODO CHANGE WIDGET TO SPECIFIC PLACE OBJECT TYPE
  List<Widget>? saved;
  UserModel(
      {required this.firstName,
      required this.lastName,
      this.visited,
      this.saved});

  String get fullName => "$firstName $lastName";
}
