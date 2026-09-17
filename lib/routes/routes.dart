import 'package:flutter/material.dart';
import 'package:random/routes/routes_names.dart';
import 'package:random/view/authentication/login_screen.dart';
import 'package:random/view/authentication/splash_screen.dart';
import 'package:random/view/home_screen.dart';

import '../view/authentication/signup_screen.dart';

class Routes {
  static MaterialPageRoute pageroute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesNames.HomeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      case RoutesNames.SplashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      case RoutesNames.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case RoutesNames.SignupScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignupScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Container(
                  child: Center(child: Text("No Routes are defined")),
                ),
              ),
            );
          },
        );
    }
  }
}
