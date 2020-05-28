import 'package:com/models/user_model.dart';
import 'package:com/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // Return Either the 'home_screen' or 'login' widget

    if (user == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
