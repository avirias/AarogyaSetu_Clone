import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class UserRepository {
  Future login({@required String mobile});
}

class UserRepositoryImpl implements UserRepository  {
  static final UserRepository _instance = UserRepositoryImpl._internal();

  factory UserRepositoryImpl() => _instance;

  UserRepositoryImpl._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future login({String mobile}) async {

  }

}
