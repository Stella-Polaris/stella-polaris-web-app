import 'package:flutter/material.dart';

import '../navigation/nav_bar.dart';

class MainLayout extends StatefulWidget {
  final String title;
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final NavigationRailLabelType labelType;
  const MainLayout(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.labelType,
      required this.title});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  Map<String, Icon> menuOptions = const {
    "Discover": Icon(Icons.search_rounded),
    "Popular Places": Icon(Icons.star),
    "Saved": Icon(Icons.bookmark_outlined),
    "Profile": Icon(Icons.person)
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: Theme.of(context).textTheme.displayMedium,
        )),
      ),
      bottomNavigationBar: BottomNavBar(
        menuParameters: MenuParameters(
            selectedIndex: widget.selectedIndex,
            onDestinationSelected: widget.onDestinationSelected,
            menuOptions: menuOptions),
      ),
      body: widget.body,
    );
  }
}
