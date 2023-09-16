import 'package:flutter/material.dart';


import '../main.dart';
import '../pages/args_test.dart';
import '../pages/main_page.dart';
import '../pages/signUp/signup.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    
    final args = settings.arguments;
    
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> const MyApp()); //starts at login page
      case '/signUp':
        return MaterialPageRoute(builder: (_)=> const SignUp()); //create account
      case '/mainPage':
        return MaterialPageRoute(builder: (_)=> const MainPage());
      case '/argsTest':
          if(args is String){
            return MaterialPageRoute(builder: (_)=> ArgTest(dataTest: args,));
          }
          return _errorRoute();
      default:
        return _errorRoute();
    }

  }


  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text("Error"),),
        body: const Text("Something went wrong"),
      );
    });
  }

}

