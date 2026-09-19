import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random/view_model/auth/auth_viewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authprovider.signout(context);
            },
            icon: Icon(Icons.logout),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
