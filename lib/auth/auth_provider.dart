import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);
}

class AuthProvider with ChangeNotifier {
  List<User> _users = [];

  int login(String email, String password) {
    for (var user in _users) {
      if (user.email == email && user.password == password) {
        return 1;
      }
    }
    return 0;
  }

  void signup(String name, String email, String password) {
    _users.add(User(name, email, password));
    notifyListeners();
  }
}
