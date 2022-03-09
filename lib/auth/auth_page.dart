import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/routes/routes.dart' as route;
import 'package:th_diary/auth/auth_provider.dart';
import 'package:th_diary/config/themes/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _wantLogin = true;
  String name = '';
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_wantLogin)
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                if (!_wantLogin) const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  cursorRadius: const Radius.circular(2),
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () {
                    try {
                      if (_wantLogin) {
                        context.read<AuthProvider>().login(email, password);
                      } else {
                        if (name.isEmpty) {
                          throw 'Please provide a name';
                        }
                        context.read<AuthProvider>().signup(name, email, password);
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        route.homePage,
                        arguments: email,
                      );
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please check your credentials..!"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    _wantLogin ? 'Login' : 'Create account',
                    // style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => setState(() {
                    _wantLogin = !_wantLogin;
                    // final users = context.read<AuthProvider>().users;
                    // if (users.isEmpty)
                    //   print('Empty');
                    // else
                    //   print(users);
                    // for (var u in users) print(u.email);
                  }),
                  child: Text(
                    _wantLogin ? 'Create an account' : 'Have an account? Login',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: secondaryTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
