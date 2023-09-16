import 'dart:io';


import 'package:flutter/material.dart';

import '../../custom widgets/models/users/user.dart';
import 'account_info.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  File? image;
  Map<String, String> positions = {};

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
    nameController.dispose();
    positionController.dispose();
    pageController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      UserData(
        emailController: emailController,
        passwordController: passwordController,
      ),
    ];

    // Function to navigate to the previous page
    void goToPreviousPage() {
      setState(() {
        pageIndex--;
        if (pageIndex != pages.length - 1) {
          nextButton = 'Next';
        }
      });
      pageController.previousPage(
        duration: transitionTime,
        curve: Curves.fastOutSlowIn,
      );
    }

    void goToNextPage() {
      bool formState = _formKey.currentState?.validate() ?? false;
      if (formState) {
        setState(() {
          pageIndex++;
          if (pageIndex == pages.length - 1) {
            nextButton = 'Finish';
          }
        });

        pageController.nextPage(
            duration: transitionTime, curve: Curves.fastOutSlowIn);
      }
    }

    void validateForm() async {
      bool formState = _formKey.currentState?.validate() ?? false;

      print(
          "SignUp.dart: ${image?.path ?? 'Nada aun'}"); //test if image is received
      if (formState) {
        print("All fields are filled");
        // then get url and add it to player
        AppUser player =
            AppUser(name: nameController.text, position: positions);

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
            const Spacer(),
            Expanded(
              child: Form(
                key: _formKey,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: pages,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: pageIndex >= 1 ? goToPreviousPage : null,
                    child: const Text('Previous')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: pageIndex != (pages.length - 1)
                        ? goToNextPage
                        : validateForm,
                    child: Text(nextButton)),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
