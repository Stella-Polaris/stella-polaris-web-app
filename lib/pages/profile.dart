import 'package:flutter/material.dart';
import 'package:stella_polaris/custom%20widgets/models/place.dart';
import 'package:stella_polaris/custom%20widgets/models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.myUser});
  final UserModel myUser;

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
    bool listStatus() {
      bool status = false;
      if (widget.myUser.visited == null) {
        status = false;
      } else {
        status = widget.myUser.visited!.isEmpty ? false : true;
      }
      return status;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                widget.myUser.fullName,
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
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Visited Places",
              style: TextStyle(fontSize: 30),
            ),
            Flexible(
                child: listStatus()
                    ? ListView.builder(
                        itemCount: widget.myUser.visited!.length,
                        itemBuilder: (buildContext, index) {
                          return PlaceItem(placeData: widget.myUser.visited![index]);

                        })
                    : Text("No places visited"))
          ],
        ),
      ),
    );
  }
}

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.placeData});
  final Place placeData;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(placeData.name),
          Text(placeData.location),
        ],
      ),
    );
  }
}
