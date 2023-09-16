import 'package:flutter/material.dart';

class AppUser {
  String name;
  AppUser({
    required this.name,
  });
}

class UserItem extends StatefulWidget {
  const UserItem({super.key, required this.userData});
  final AppUser userData;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  List<String>? positionList;
  String? positionText;

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: [
          Text(widget.userData.name),

        ],
      ),
    );
  }
}
