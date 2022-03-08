import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'config/themes/theme.dart';
import 'config/routes/routes.dart' as route;
import 'providers/diary_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiaryProvider()),
      ],
      child: const Diary(),
    ),
  );
}

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diary',
      theme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
    );
  }
}
