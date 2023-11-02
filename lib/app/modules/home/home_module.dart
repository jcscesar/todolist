import 'package:todolist/app/core/modules/todo_list_module.dart';
import 'package:todolist/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [],
          routers: {
            '/home': (context) => const HomePage(),
          },
        );
}
