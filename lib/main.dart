import 'package:example_project/ui/auth/auth_screen.dart';
import 'package:example_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di.dart';

void main() async {
  await di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xFFFAFAFA),
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthScreen.routeName,
      title: 'Test UI',
      routes: {
        AuthScreen.routeName: (BuildContext context) => const AuthScreen(),
        ProfileScreen.routeName: (BuildContext context) => const ProfileScreen(),
      },
    );
  }
}
