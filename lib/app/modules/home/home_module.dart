import 'package:provider/provider.dart';
import 'package:todolist/app/core/modules/todo_list_module.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => HomeController(),
            ),
          ],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
