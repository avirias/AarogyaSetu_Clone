import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {

  final User user;

  const DemoPage({Key key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.phoneNumber),
      ),
    );
  }
}
