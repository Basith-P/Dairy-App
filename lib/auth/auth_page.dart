import 'package:flutter/material.dart';
import 'package:th_diary/config/themes/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _wantLogin = false;

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
                  ),
                if (!_wantLogin) const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    _wantLogin ? 'Login' : 'Create account',
                    // style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => setState(() {
                    _wantLogin = !_wantLogin;
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
