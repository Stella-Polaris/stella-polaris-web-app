import 'package:flutter/material.dart';
import 'package:stella_polaris/custom%20widgets/models/place.dart';
import 'package:stella_polaris/pages/popular_places.dart';
import 'package:stella_polaris/pages/profile.dart';
import 'package:stella_polaris/pages/saved.dart';

import '../custom widgets/main_layout.dart';
import '../custom widgets/models/user.dart';
import 'discover.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Place> visited = [
    Place(
        name: "My Home",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
    Place(
        name: "USA",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
    Place(
        name: "Everglades",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
    Place(
        name: "Church",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
  ];
  List<Place> saved = [
    Place(
        name: "Florida",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
    Place(
        name: "FIU",
        imageUrl: ["www.google.com", "www.amazon.com"],
        description: ["search engine", 'online store'],
        location: "here"),
  ];

  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel myUser = UserModel(
        firstName: 'Carlos', lastName: 'Zafon', visited: visited, saved: saved);
    List<Widget> pages = [
      const Discover(),
      const PopularPlaces(),
      Saved(myUser: myUser),
      Profile(
        myUser: myUser,
      ),
    ];
    return MainLayout(
        body: IndexedStack(
          alignment: Alignment.bottomCenter,
          index: _selectedIndex,
          children: pages,
        ),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelType: labelType,
        title: "Stella Polaris");
  }
}
