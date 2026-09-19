import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random/routes/routes.dart';
import 'package:random/routes/routes_names.dart';
import 'package:random/view_model/auth/auth_viewModel.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewmodel())],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            initialRoute: RoutesNames.loginScreen,
            onGenerateRoute: Routes.pageroute,
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: true,
                color: Colors.purple,
                titleTextStyle: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
