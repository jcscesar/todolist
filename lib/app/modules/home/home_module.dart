import 'package:provider/provider.dart';
import 'package:todolist/app/core/modules/todo_list_module.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_page.dart';
import 'package:todolist/app/modules/tasks/tasks_controller.dart';
import 'package:todolist/app/repositories/tasks/taks_repository.dart';
import 'package:todolist/app/repositories/tasks/taks_repository_impl.dart';
import 'package:todolist/app/services/tasks/tasks_service.dart';
import 'package:todolist/app/services/tasks/tasks_serviceimpl.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
            Provider<TasksRepository>(
              create: (context) => TaksRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TasksService>(
              create: (context) => TasksServiceimpl(
                taksRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => HomeController(
                tasksService: context.read(),
              ),
            )
          ],
          routers: {
            '/home': (context) => HomePage(
                  homeController: context.read(),
                ),
          },
        );
}
