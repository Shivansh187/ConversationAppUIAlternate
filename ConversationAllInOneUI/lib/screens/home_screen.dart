import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/services/auth.dart';
import 'package:com/utilities/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:com/services/database.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().persons,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Text(
            "Conversation",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              iconSize: 20.0,
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 20.0,
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              iconSize: 20.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: CategorySelector(),
      ),
    );
  }
}
