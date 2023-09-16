import 'package:flutter/widgets.dart';
import 'package:stella_polaris/custom%20widgets/models/users/user.dart';

class Saved extends StatefulWidget {
  const Saved({super.key, required this.user});
  final AppUser user;

  get userData => null;

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {


  List<Widget> listStatus(){
    bool status = false;

    if(widget.userData.visited == null){
      status = false;
      return [Text("No places saved yet")];
    }else{
      return widget.userData.visited!.isEmpty?[Text("No places saved yet")]:widget.userData.visited;

    }

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listStatus(),
    );
  }
}
