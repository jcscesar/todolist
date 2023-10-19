import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/modules/auth/login/login_controller.dart';
import 'package:todolist/app/modules/auth/login/login_page.dart';
import 'package:todolist/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/login': (_) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => LoginController()),
              ],
              child: const LoginPage(),
            ),
      },
    );
  }
}
