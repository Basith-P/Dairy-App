import 'package:flutter/material.dart';

import '../../views/home/home_page.dart';
import '../../views/auth/auth_page.dart';

const String homePage = 'home';
const String authPage = 'auth';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case authPage:
      return MaterialPageRoute(builder: (_) => AuthPage());
    default:
      throw ('This route does not exists!');
  }
}
