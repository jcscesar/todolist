import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/core/ui/todolisticon_icons.dart';
import 'package:todolist/app/modules/home/widget/home_drawer.dart';
import 'package:todolist/app/modules/home/widget/home_filters.dart';
import 'package:todolist/app/modules/home/widget/home_header.dart';
import 'package:todolist/app/modules/home/widget/home_tasks.dart';
import 'package:todolist/app/modules/home/widget/home_week_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      backgroundColor: Color(ColorsExtensions().cinza.value),
      drawer: HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
