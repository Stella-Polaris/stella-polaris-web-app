import 'package:flutter/material.dart';

class AppUser {
  String firstName;
  String lastName;
  List<Widget>? saved;
  List<Widget>? visited; //TODO CHANGE WIDGET TO SPECIFIC PLACE OBJECT TYPE
  AppUser({required this.firstName, required this.lastName, this.visited});

  String get fullName => "$firstName $lastName";
}

class UserItem extends StatefulWidget {
  const UserItem({super.key, required this.userData});
  final AppUser userData;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {

  bool listStatus(){
    bool status = false;
    if(widget.userData.visited == null){
      status = false;
    }else{
      status = widget.userData.visited!.isEmpty?false:true;
    }
    return status;

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                widget.userData.fullName,
                style: TextStyle(fontSize: 35),
              ),
            ),

            InkWell(
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Edit settings")
                ],
              ),
              onTap: () {
                print("click");
              },
            ),
            Divider(thickness: 2,),
            SizedBox(height: 20,),
            Text("Visited Places", style: TextStyle(fontSize: 30),),
            Card(
              child: SizedBox(
                  height: 300,
                  child: ListView(
                    children:  listStatus() ? widget.userData.visited!:
                        [Text("No places visited yet")],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
