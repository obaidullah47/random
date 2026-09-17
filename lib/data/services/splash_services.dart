import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:random/routes/routes_names.dart';

class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, RoutesNames.HomeScreen);
    } else {
      Navigator.pushReplacementNamed(context, RoutesNames.loginScreen);
    }
  }
}
