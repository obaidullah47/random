import 'package:flutter/cupertino.dart';
import 'package:random/common/error/app_exceptions.dart';
import 'package:random/common/utils/general_utils.dart';
import 'package:random/data/Repository/auth/authentication.dart';
import 'package:random/routes/routes_names.dart';

class AuthViewmodel with ChangeNotifier {
  final Authentication _authentication = Authentication();
  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signup(email, password, BuildContext context) async {
    setloading(true);
    try {
      _authentication.Signupwithemail(email, password)
          .then((value) {
            setloading(false);
            Navigator.pushReplacementNamed(context, RoutesNames.HomeScreen);
            GeneralUtils.flushbarmessage(context, "Account Created ");
          })
          .catchError((error, StackTrace) {
            setloading(false);
            GeneralUtils.toastmessage(error.toString());
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginwithemail(
    String email,
    String password,
    BuildContext context,
  ) async {
    setloading(true);
    try {
      _authentication
          .loginwithemail(email, password)
          .then((value) {
            setloading(false);
            Navigator.pushReplacementNamed(context, RoutesNames.HomeScreen);
            GeneralUtils.flushbarmessage(context, 'Login successfully');
          })
          .onError((error, StackTrace) {
            setloading(false);
            GeneralUtils.flushbarmessage(context, error.toString());
          });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout(BuildContext context) async {
    setloading(true);
    try {
      _authentication
          .logout()
          .then((value) {
            setloading(false);
            Navigator.pushReplacementNamed(context, RoutesNames.loginScreen);
            GeneralUtils.flushbarmessage(context, "Logout Successfully");
          })
          .onError((error, StackTrace) {
            setloading(false);
            GeneralUtils.flushbarmessage(context, error.toString());
          });
    } catch (e) {
      throw FetchDataException(message: "Something went wrong");
    }
  }
}
