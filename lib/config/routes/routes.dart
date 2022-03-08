import 'package:flutter/material.dart';

import '../../views/home/home_page.dart';
import '../../views/auth/auth_page.dart';
import '../../views/new_diary/new_diary_page.dart';

const String homePage = 'home';
const String authPage = 'auth';
const String newDiaryPage = 'newDiary';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case authPage:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case homePage:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case newDiaryPage:
      return MaterialPageRoute(builder: (_) => NewDiaryPage());
    default:
      throw ('This route does not exists!');
  }
}
