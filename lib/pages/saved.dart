import 'package:flutter/widgets.dart';
import 'package:stella_polaris/custom%20widgets/models/users/user.dart';

class Saved extends StatefulWidget {
  const Saved({super.key, required this.myUser});
  final UserModel myUser;


  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {


  List<Widget> listStatus(){

    if(widget.myUser.visited == null){
      return const [Text("No places saved yet")];
    }else{
      return widget.myUser.visited!.isEmpty?[const Text("No places saved yet")]:widget.myUser.visited!;

    }

  }
  @override
  Widget build(BuildContext context) {
    print(listStatus());
    return ListView(
      children: listStatus(),
    );
  }
}
