import 'package:flutter/material.dart';

import '../../views/home/home_page.dart';

String homePage = 'home';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case 'homePage':
      return MaterialPageRoute(builder: (_) => HomePage());
    default:
      throw ('This route does not exists!');
  }
}
