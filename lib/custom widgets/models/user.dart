import 'package:flutter/material.dart';
import 'package:stella_polaris/custom%20widgets/models/place.dart';

class UserModel {
  String firstName;
  String lastName;
  List<Place>? visited; //TODO CHANGE WIDGET TO SPECIFIC PLACE OBJECT TYPE
  List<Place>? saved;
  UserModel(
      {required this.firstName,
      required this.lastName,
      this.visited,
      this.saved});

  String get fullName => "$firstName $lastName";
}
