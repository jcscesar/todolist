import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/models/task_filter_enum.dart';
import 'package:todolist/app/models/task_model.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/widget/task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Selector<HomeController, String>(
            builder: (context, value, child) {
              return Text(
                'TASK\'S $value',
                style: context.titleStyle.copyWith(fontSize: 12),
              );
            },
            selector: (context, controller) {
              return controller.filterSelected.description;
            },
          ),
          Column(
            children: context
                .select<HomeController, List<TaskModel>>(
                    (controller) => controller.filteredTasks)
                .map(
                  (t) => Task(model: t),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
