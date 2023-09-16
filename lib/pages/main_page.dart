import 'package:flutter/material.dart';
import 'package:stella_polaris/pages/popular_places.dart';
import 'package:stella_polaris/pages/profile.dart';
import 'package:stella_polaris/pages/saved.dart';

import '../custom widgets/main_layout.dart';
import '../custom widgets/models/users/user.dart';
import 'discover.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> visited = [
    Text("My home"),
    Text("USA"),
    Text("Everglades"),
    Text("Church")
  ];
  List<Widget> saved = [Text("Florida"), Text("FIU")];

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
