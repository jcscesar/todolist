import 'package:flutter/material.dart';
import 'package:todolist/app/core/notifier/default_listener_notifier.dart';

import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/core/ui/todolisticon_icons.dart';
import 'package:todolist/app/models/task_filter_enum.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/widget/home_drawer.dart';
import 'package:todolist/app/modules/home/widget/home_filters.dart';
import 'package:todolist/app/modules/home/widget/home_header.dart';
import 'package:todolist/app/modules/home/widget/home_tasks.dart';
import 'package:todolist/app/modules/home/widget/home_week_filter.dart';
import 'package:todolist/app/modules/tasks/tasks_module.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;
  const HomePage({
    Key? key,
    required HomeController homeController,
  })  : _homeController = homeController,
        super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(defaultChangeNotifier: widget._homeController)
        .listener(
      context: context,
      successVoidCallback: (notifier, listenerNotifier) {
        listenerNotifier.dispose();
      },
    );
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget._homeController.loadTotalTasks();
      widget._homeController.findTasks(filter: TaskFilterEnum.today);
    });
  }

  Future<void> _goToCreateTask(BuildContext context) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/task/create', context);
        },
      ),
    );
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: const Icon(Todolisticon.filter),
            itemBuilder: (_) => [
              const PopupMenuItem<bool>(
                child: Text('Mostrar tarefas concluidas'),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(ColorsExtensions().background.value),
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateTask(context),
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
