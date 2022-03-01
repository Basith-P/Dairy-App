import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/themes/theme.dart';
import 'config/routes/routes.dart' as route;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Diary());
}

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary',
      theme: CustomTheme.darkTheme,
      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
    );
  }
}
