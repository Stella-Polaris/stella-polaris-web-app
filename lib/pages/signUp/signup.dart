
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../../custom widgets/models/users/user.dart';
import '../../custom widgets/my_text_field.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final PageController pageController = PageController();
  int pageIndex = 0;
  Duration transitionTime = const Duration(milliseconds: 700);
  String nextButton = 'Next';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();

    pageController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    void validateForm() async {
      bool formState = _formKey.currentState?.validate() ?? false;


      if (formState) {
        print("All fields are filled");
        // then get url and add it to player
        UserModel user =
            UserModel(firstName: firstNameController.text, lastName: lastNameController.text );

      }


        Navigator.of(context).pop();

    }

    ///////////////////////////////////////////////////////
    // Interface
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Create account')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserData(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            ElevatedButton(onPressed: (){
              //call validator on the fields

              //navigate to home
              Navigator.of(context).pushReplacementNamed("/mainPage");

            }, child: const Text("Register"))
          ],
        )
      ),
    );
  }
}


class UserData extends StatefulWidget {
  const UserData(
      {super.key,
        required this.emailController,
        required this.passwordController, required this.firstNameController, required this.lastNameController});
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(child: Text("Account Info")),
          MyTextField(
            hint: 'First Name',
            icon: Icons.text_fields,
            controller: widget.firstNameController,

          ),
          MyTextField(
            hint: 'Last Name',
            icon: Icons.text_fields,
            controller: widget.lastNameController,

          ),
          MyTextField(
            hint: 'Email',
            icon: Icons.email,
            controller: widget.emailController,
            validator:
            ValidationBuilder().email("Please enter a valid email").build(),
          ),
          MyTextField(
            hint: 'Password',
            icon: Icons.lock,
            obscureText: true,
            controller: widget.passwordController,

            helperText: 'Password must be at least 6 characters',
          ),
        ],
      ),
    );
  }
}
