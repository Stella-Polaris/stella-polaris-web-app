import 'package:flutter/material.dart';
import 'package:stella_polaris/custom%20widgets/models/users/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.myUser});
  final AppUser myUser;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: UserItem(
        userData: AppUser(firstName: widget.myUser.firstName, lastName: widget.myUser.lastName, visited: widget.myUser.visited),
      ),
    );
  }
}
