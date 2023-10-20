import 'package:provider/provider.dart';
import 'package:todolist/app/core/modules/todo_list_module.dart';
import 'package:todolist/app/modules/auth/login/login_controller.dart';
import 'package:todolist/app/modules/auth/login/login_page.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
          },
        );
}
