import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random/routes/routes.dart';
import 'package:random/routes/routes_names.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: RoutesNames.loginScreen,
      onGenerateRoute: Routes.pageroute,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.purple,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
