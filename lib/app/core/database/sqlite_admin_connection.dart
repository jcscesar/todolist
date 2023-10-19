import 'package:flutter/material.dart';
import 'package:todolist/app/core/database/sqlite_connection_factory.dart';

class SqliteAdminConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final connection = SqliteConnectionFactory();
    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        connection.closeConnection();
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.hidden:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
