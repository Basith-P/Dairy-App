import 'package:flutter/material.dart';

import '../../views/home/home_page.dart';
import '../../views/auth/auth_page.dart';
import '../../views/new_diary/new_diary_page.dart';
import '../../views/single_diary/single_diary_page.dart';

const String homePage = 'home';
const String authPage = 'auth';
const String newDiaryPage = 'newDiary';
const String singleDiaryPage = 'singleDiary';

Route<dynamic> controller(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case authPage:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case homePage:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case newDiaryPage:
      return MaterialPageRoute(builder: (_) => NewDiaryPage());
    case singleDiaryPage:
      return MaterialPageRoute(builder: (_) => SingleDiaryPage(args.toString()));
    default:
      throw ('This route does not exists!');
  }
}
