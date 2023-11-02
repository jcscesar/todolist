import 'package:flutter/material.dart';
import 'package:todolist/app/core/database/sqlite_admin_connection.dart';
import 'package:todolist/app/core/navigator/todo_list_navigator.dart';
import 'package:todolist/app/core/ui/todo_ui_list_config.dart';
import 'package:todolist/app/modules/auth/auth_module.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var sqliteAdmConnection = SqliteAdminConnection();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      theme: TodoUiListConfig.theme,
      navigatorKey: TodoListNavigator.navigatorKey,
      routes: {
        ...AuthModule().routers,
        ...HomeModule().routers,
      },
    );
  }
}
